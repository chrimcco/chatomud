require 'mixins/characters/genders/utils'

module ChatoMud

  module Controllers

    module Entities

      class PossessionController

        attr_reader :possessed_controller
        attr_reader :possessing_controller

        include Mixins::Characters::Genders::Utils

        def initialize(server, entity_controller)
          @server = server
          @entity_controller = entity_controller
          @possessed_controller = nil
          @possessing_controller = nil
        end

        def is_possessing?
          !!@possessed_controller
        end

        def is_possessed?
          !!@possessing_controller
        end

        def possess(possessed_controller)
          @possessed_controller = possessed_controller
          @entity_controller.tx("You take command of #{possessed_controller.character_controller.short_desc}.", true)
          @possessed_controller.possession_controller.be_possessed(@entity_controller)
        end

        def be_possessed(possessing_controller)
          @entity_controller.tx("You feel a force taking over you ...")
          @possessing_controller = possessing_controller
        end

        def release(reason)
          character_controller = @possessed_controller.character_controller
          @possessed_controller = nil
          case reason
            when :possesser_death
              @entity_controller.tx("You leave the mind of #{character_controller.short_desc} as your own body dies ...", true)
            when :vessel_death
              @entity_controller.tx("#{character_controller.short_desc} has died, you leave #{possessive(character_controller.gender)} mind.", true)
            when :released
              @entity_controller.tx("You abandon the mind of #{character_controller.short_desc}.", true)
            else
              raise "Unknown reason for possession release."
          end
        end

        def be_released(reason)
          @possessing_controller.possession_controller.release(reason)
          @possessing_controller = nil
          case reason
            when :possesser_death
              @entity_controller.tx("You feel the presence vanish abruptly from your mind.")    
            when :vessel_death
              @entity_controller.tx("The presence leaves your mind as you die.")
            when :released
              @entity_controller.tx("You feel the presence leaving your mind.")
            else
              raise "Unknown reason for possession be_released."
          end
        end

        def handle_death_when_possessing
          return unless is_possessing?

          @possessed_controller.possession_controller.be_released(:possesser_death)
        end

        def handle_death_when_possessed
          return unless is_possessed?

          be_released(:vessel_death)
        end

      end

    end

  end

end