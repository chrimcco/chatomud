require 'controllers/base_controller'

require 'controllers/furnitures/furniture_controller'

require 'mixins/rooms/showable'
require 'mixins/rooms/connected'
require 'mixins/rooms/characters_container'
require 'mixins/rooms/furnitures_container'
require 'mixins/rooms/echoes/emitter/emitter'

module ChatoMud

  module Controllers

    module Rooms

      class RoomController < BaseController

        attr_reader :inventory_controller

        include Mixins::Rooms::Showable
        include Mixins::Rooms::Connected
        include Mixins::Rooms::CharactersContainer
        include Mixins::Rooms::FurnituresContainer
        include Mixins::Rooms::Echoes::Emitter

        def initialize(server, room)
          @server = server
          @room = room
          @character_controllers = []
          @furniture_controllers = []
          @inventory_controller = Inventories::BoxInventoryController.new(@server, self, @room.inventory)
          @room.furnitures.each do |furniture|
            Furnitures::FurnitureController.new(@server, furniture, self)
          end
          @server.rooms_handler.add_room_controller(self)
        end

        def bye
          @server.rooms_handler.remove_room_controller(self)
        end

        def id
          @room.id
        end

        def title
          @room.title
        end

        def description
          @room.description
        end

      end

    end

  end

end