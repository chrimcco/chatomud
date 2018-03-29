module ChatoMud

  module Mixins

    module Characters

      module Stats

        module Combat

          module Ranged

            module Offense

              def ranged_offensive_capabilities
                capabilities = base_ranged_offensive_capabilities

                capabilities.each_with_index do |capability, index|
                  capabilities[index][:modifier] += ranged_offensive_capabilities_armor_penalty
                end

                capabilities.each do |capability|
                  capability[:modifier] = capability[:modifier].round
                end
              end

              def ranged_offensive_capabilities_list
                ranged_offensive_capabilities.map do |ranged_offensive_capability|
                  ranged_weapon_controller = ranged_offensive_capability[:ranged_weapon_controller]
                  "#{ranged_weapon_controller.short_desc} (#{ranged_offensive_capability[:skill]}) (#{ranged_offensive_capability[:modifier]})"
                end.join(", ")
              end

              def base_ranged_offensive_capabilities
                capabilities = []

                ranged_weapon_controllers = inventory_controller.ranged_weapon_controllers(:wielded, true)

                ranged_weapon_controllers.each do |ranged_weapon_controller|
                  capabilities << {
                    ranged_weapon_controller: ranged_weapon_controller,
                    skill: ranged_weapon_controller.weapon_stat_controller.skill,
                    modifier: skill_modifier(ranged_weapon_controller.weapon_stat_controller.skill)
                  }
                end

                capabilities
              end

              def base_ranged_offensive_capabilities_list
                base_ranged_offensive_capabilities.map do |ranged_offensive_capability|
                  ranged_weapon_controller = ranged_offensive_capability[:ranged_weapon_controller]

                  "#{ranged_weapon_controller.short_desc}(#{ranged_offensive_capability[:modifier]})"
                end.join(", ")
              end

              def base_ranged_offensive_capabilities_modifiers
                base_ranged_offensive_capabilities.map do |base_ranged_offensive_capability|
                  base_ranged_offensive_capability[:modifier]
                end
              end

            end

          end

        end

      end

    end

  end

end
