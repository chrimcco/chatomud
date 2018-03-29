require 'mixins/characters/stats/combat/common.rb'

module ChatoMud

  module Mixins

    module Characters

      module Stats

        module Combat

          module Melee

            module Offense
              include Common

              def melee_offensive_capabilities
                capabilities = base_melee_offensive_capabilities

                capabilities.each_with_index do |capability, index|
                  capabilities[index][:modifier] *= stance_offensive_percentage
                  capabilities[index][:modifier] += melee_offensive_capabilities_armor_penalty
                  capabilities[index][:modifier] += dual_wield_modifiers[index] if inventory_controller.is_dual_wielding?
                end

                capabilities.each do |capability|
                  capability[:modifier] = capability[:modifier].round
                end
              end

              def melee_offensive_capabilities_list
                melee_offensive_capabilities.map do |melee_offensive_capability|
                  melee_weapon_controller = melee_offensive_capability[:melee_weapon_controller]

                  melee_weapon_controller_short_desc = melee_weapon_controller ? melee_weapon_controller.short_desc : 'fists'

                  "#{melee_weapon_controller_short_desc} (#{melee_offensive_capability[:skill]}) (#{melee_offensive_capability[:modifier]})"
                end.join(", ")
              end

              def base_melee_offensive_capabilities
                capabilities = []

                melee_weapon_controllers = inventory_controller.melee_weapon_controllers(:wielded)

                melee_weapon_controllers.each do |melee_weapon_controller|
                  capabilities << {
                    melee_weapon_controller: melee_weapon_controller,
                    skill_name: melee_weapon_controller.weapon_stat_controller.skill,
                    modifier: melee_offensive_skill_modifier(melee_weapon_controller.weapon_stat_controller.skill)
                  }
                end

                capabilities = [
                  {
                    melee_weapon_controller: nil,
                    skill_name: :brawl,
                    modifier: skill_modifier(:brawl)
                  }
                ] if melee_weapon_controllers.empty?

                capabilities
              end

              def base_melee_offensive_capabilities_list
                base_melee_offensive_capabilities.map do |melee_offensive_capability|
                  melee_weapon_controller = melee_offensive_capability[:melee_weapon_controller]

                  melee_weapon_controller_short_desc = melee_weapon_controller ? melee_weapon_controller.short_desc : 'fists'

                  "#{melee_weapon_controller_short_desc}(#{melee_offensive_capability[:modifier]})"
                end.join(", ")
              end

              def base_melee_offensive_capabilities_modifiers
                base_melee_offensive_capabilities.map do |base_melee_offensive_capability|
                  base_melee_offensive_capability[:modifier]
                end
              end

              def melee_offensive_skill_modifier(skill_name)
                modifier = skill_modifier(skill_name)

                modifier = [modifier, skill_modifier(:dual_wield)].min if inventory_controller.is_dual_wielding?

                modifier
              end

              # TODO move to def
              def dual_wield_modifiers
                case skill_rank(:dual_wield).label.to_sym
                  when :unskilled
                    [-40, -20]
                  when :neophyte
                    [-15, -20]
                  when :amateur
                    [-10, -15]
                  when :familiar
                    [ -5, -10]
                  when :adroit
                    [  0,  -5]
                  when :master
                    [  5,   0]
                  when :grandmaster
                    [ 10,   5]
                  else
                    raise "unknown label for dual-wield skill"
                end
              end

            end

          end

        end

      end

    end

  end

end
