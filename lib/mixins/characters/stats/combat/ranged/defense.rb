module ChatoMud

  module Mixins

    module Characters

      module Stats

        module Combat

          module Ranged

            module Defense

              def ranged_defensive_capability(assailant_controller = nil)
                modifier  = 0
                modifier += defensive_quickness_modifier
                modifier += ranged_defensive_shield_modifier
                modifier += defensive_dodge_modifier
                modifier += ranged_defensive_position_modifier

                modifier.round
              end

              def ranged_defensive_shield_modifier
                inventory_controller.shield_item_controllers.map do |item_controller|
                  item_controller.shield_stat_controller.ranged_bonus
                end.sum
              end

              def ranged_defensive_position_modifier
                return -20 if @character_controller.position_controller.is_resting?
                return -30 if @character_controller.position_controller.is_sitting?
                0
              end

            end

          end

        end

      end

    end

  end

end
