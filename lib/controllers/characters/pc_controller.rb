require 'controllers/characters/character_controller'

module ChatoMud

  module Controllers

    module Characters

      class PcController < CharacterController

        def initialize(server, player_controller, character, room_controller)
          super(server, player_controller, character, room_controller)
        end

        def bye
          super
        end

        def die
          @character.update(active: false)
          super
        end

        def is_npc?
          false
        end

        def is_pc?
          true
        end

      end

    end

  end

end