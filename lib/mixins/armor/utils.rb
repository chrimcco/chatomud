module ChatoMud

  module Mixins

    module Armor

      module Utils

        def maneuver_armor_penalty
          result = 0

          inventory_controller.armor_item_controllers.each do |armor_controller|
            result += compute_maneuver_armor_penalty(armor_controller)
          end

          result.round
        end

        def quickness_armor_penalty
          result = 0
          
          inventory_controller.armor_item_controllers.each do |armor_controller|
            result += compute_quickness_armor_penalty(armor_controller)
          end

          result.round
        end

        def melee_offensive_capabilities_armor_penalty
          (maneuver_armor_penalty / 6).round
        end

        def ranged_offensive_capabilities_armor_penalty
          result = 0

          inventory_controller.armor_item_controllers.each do |armor_controller|
            result += compute_ranged_attack_armor_penalty(armor_controller)
          end

          result.round
        end

        private

        def find_protection(item_controller)
          protection_referrer.find(item_controller.armor_stat_controller.level)
        end

        def compute_maneuver_armor_penalty(armor_controller)
          protection = find_protection(armor_controller)
          skill_bonus = skill_modifier(protection.skill.to_sym)
          maneuver_impediment_factor = maneuver_impediment_factor_for(armor_controller.armor_stat_controller.maneuver_impediment)

          max_maneuver_penalty = protection.max_maneuver_penalty + skill_bonus
          min_maneuver_penalty = protection.min_maneuver_penalty
          [min_maneuver_penalty, max_maneuver_penalty].min * maneuver_impediment_factor
        end

        def compute_ranged_attack_armor_penalty(armor_controller)
          protection = find_protection(armor_controller)
          ranged_attack_impediment_factor = ranged_attack_impediment_factor_for(armor_controller.armor_stat_controller.ranged_attack_impediment)

          protection.ranged_attack_penalty * ranged_attack_impediment_factor
        end

        def compute_quickness_armor_penalty(armor_controller)
          protection = find_protection(armor_controller)
          skill_bonus = skill_modifier(protection.skill.to_sym)
          maneuver_impediment_factor = maneuver_impediment_factor_for(armor_controller.armor_stat_controller.maneuver_impediment)

          [0, protection.quickness_penalty - (skill_bonus / 4).round].max * maneuver_impediment_factor
        end

        # TODO MOVE TO DEF
        def maneuver_impediment_factor_for(maneuver_impediment)
          return case maneuver_impediment
            when :lowest_mi
              0.125
            when :low_mi
              0.1875
            when :medium_mi
              0.25
            when :high_mi
              0.375
            when :highest_mi
              0.5
            else
              raise "maneuver impediment factor for unknown maneuver impediment"
          end
        end

        def ranged_attack_impediment_factor_for(ranged_impediment)
          return case ranged_impediment
            when :no_rai
              0.0
            when :low_rai
              0.125
            when :medium_rai
              0.25
            when :high_rai
              0.5
            else
              raise "ranged impediment factor for unknown ranged impediment"
          end
        end

      end

    end

  end

end
