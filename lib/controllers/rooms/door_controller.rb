require 'mixins/describable/door'
require 'mixins/closable'

module ChatoMud

  module Controllers

    module Rooms

      class DoorController
        attr_reader :lock_controller

        include Mixins::Describable::Door
        include Mixins::Closable

        def initialize(server, door)
          @server = server
          @door = door
          @lock_controller = door.lock ? Controllers::LockController.new(door.lock) : nil
          @server.doors_handler.add_door_controller(self)
        end

        def bye
          @server.doors_handler.remove_door_controller(self)
        end

        def is_lockable?
          !!@lock_controller
        end

        def is_horizontal?

        end

        def is_vertical?

        end

        def is_depth?

        end

        def model
          @door
        end

        # Attribute methods
        #####################################################
        def id
          @door.id
        end

      end

    end

  end

end