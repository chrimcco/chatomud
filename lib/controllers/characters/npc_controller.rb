require 'controllers/characters/character_controller'

module ChatoMud

  module Controllers

    module Characters

      class NpcController < CharacterController

        def initialize(server, character, room_controller)
          super(server, nil, character, room_controller)
        end

        def bye
          super
        end

        def die
          super
          @character.destroy
        end

        def is_npc?
          true
        end

        def is_pc?
          false
        end

      end

    end

  end

end