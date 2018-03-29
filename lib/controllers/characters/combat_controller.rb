require 'mixins/body_parts/definition'

require 'mixins/characters/combat/target'
require 'mixins/characters/combat/assailant'

module ChatoMud

  module Controllers

    module Characters

      class CombatController

        attr_reader :target

        extend Mixins::BodyParts::Definition

        include Mixins::Characters::Combat::Target
        include Mixins::Characters::Combat::Assailant

        def initialize(server, character_controller)
          @server = server
          @character_controller = character_controller
          @combat_thread = nil
          @assailants = []
          @target = nil
          start_combat_thread
        end

        def is_in_combat?
          is_attacking? || is_being_attacked?
        end

        private

        def health_controller
          @character_controller.health_controller
        end

        def inventory_controller
          @character_controller.inventory_controller
        end

        def choice_controller
          @character_controller.choice_controller
        end

        def room_controller
          @character_controller.room_controller
        end

        def attack_referrer
          @server.attack_referrer
        end

      end

    end

  end

end