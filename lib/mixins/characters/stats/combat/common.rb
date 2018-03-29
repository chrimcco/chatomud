module ChatoMud

  module Mixins

    module Characters

      module Stats

        module Combat

          module Common

            def stance_offensive_percentage
              offensive_percentage_for(@character_controller.choice_controller.stance)
            end

            def stance_defensive_percentage
              defensive_percentage_for(@character_controller.choice_controller.stance)
            end

            def defensive_quickness_modifier
              return 0 if @character_controller.position_controller.is_sitting_or_resting?

              base = attribute_bonus_referrer.find(attribute_value(:agi)).bonus * 2 + attribute_bonus_referrer.find(attribute_value(:pow)).bonus
              base - quickness_armor_penalty
            end

            def defensive_dodge_modifier
              dodge_skill_modifier = skill_modifier(:dodge)

              [dodge_skill_modifier + maneuver_armor_penalty, 0].max
            end

          end

        end

      end

    end

  end

end
