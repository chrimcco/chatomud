require 'controllers/characters/health/wound_controller'

require 'mixins/characters/health/mending'
require 'mixins/characters/health/liveness'
require 'mixins/characters/health/quick_status'

require 'mixins/damage/utils'

module ChatoMud

  module Controllers

    module Characters

      module Health

        class HealthController

          include Mixins::Damage::Utils
          include Mixins::Characters::Health::Liveness
          include Mixins::Characters::Health::Mending
          include Mixins::Characters::Health::QuickStatus

          def initialize(server, character_controller, health)
            @server = server
            @character_controller = character_controller
            @health = health

            @wound_controllers = []
            health.wounds.each do |wound|
              WoundController.new(@server, self, wound)
            end

            @conscious = hits > unconsciousness_hits

            start_mending
          end

          def max_hits
            50 + (stats_controller.skill_modifier(:body_development) / 2.0).round
          end

          def hits
            max_hits - @wound_controllers.map(&:damage).sum
          end

          def wounded?
            @wound_controllers.length > 0
          end

          def add_wound_controller(wound_controller)
            @wound_controllers << wound_controller
          end

          def remove_wound_controller(wound_controller)
            @wound_controllers.delete(wound_controller)
          end

          def list_wounds(gender)
            @wound_controllers.map(&:description).to_sentence
          end

          def suffer_melee_attack(attack, body_part)
            damage_type = regular_damage_type_for(attack.skill.to_sym)

            wound = @health.wounds.create!(damage: attack.hits, body_part: body_part, damage_type: damage_type, inventory: nil)

            WoundController.new(@server, self, wound)
          end

          def suffer_ranged_attack(attack, body_part, missile_controller)
            damage_type = regular_damage_type_for(attack.skill.to_sym)

            wound = @health.wounds.create!(damage: attack.hits, body_part: body_part, damage_type: damage_type, inventory: Inventory.new)

            wound_controller = WoundController.new(@server, self, wound)

            wound_controller.inventory_controller.accept_item(missile_controller, true)
          end          

          def bye
            stop_mending
          end

          private

          def stats_controller
            @character_controller.stats_controller
          end

          def attribute_bonus_referrer
            @server.attribute_bonus_referrer
          end

        end

      end

    end

  end

end