require 'mixins/characters/stats/combat/common.rb'

module ChatoMud

  module Mixins

    module Characters

      module Stats

        module Combat

          module Melee

            module Defense
              include Common

              def melee_defensive_capabilities(assailant_controller = nil)
                base_modifiers = base_melee_offensive_capabilities_modifiers
                base_modifier  = (base_modifiers.inject(:+).to_f / base_modifiers.size).round
                defensive_capabilities = {
                  base: base_modifier,
                  stance: (base_modifier * stance_defensive_percentage).round,
                  quickness: defensive_quickness_modifier,
                  parry: melee_defensive_parry_modifier,
                  dodge: defensive_dodge_modifier,
                  shield: melee_defensive_shield_modifier(assailant_controller),
                  flanking: assailant_controller ? melee_defensive_flanking_modifier(assailant_controller) : 0,
                  position: melee_defensive_position_modifier
                }

                defensive_capabilities[:total] =
                  defensive_capabilities[:stance] +
                  defensive_capabilities[:quickness] +
                  defensive_capabilities[:parry] +
                  defensive_capabilities[:dodge] +
                  defensive_capabilities[:shield] +
                  defensive_capabilities[:flanking] +
                  defensive_capabilities[:position]

                defensive_capabilities
              end

              private

              def melee_defensive_parry_modifier
                parry_skill_modifier = skill_modifier(:parry)

                result = 0

                inventory_controller.melee_weapon_controllers(:wielded).each do |melee_weapon_controller|
                  melee_weapon_skill_modifier = skill_modifier(melee_weapon_controller.weapon_stat_controller.skill)
                  result += [parry_skill_modifier, melee_weapon_skill_modifier].min
                end

                result
              end

              def melee_defensive_shield_modifier(assailant_controller)
                inventory_controller.shield_item_controllers.map do |item_controller|
                  potential = item_controller.shield_stat_controller.melee_bonus

                  return potential unless assailant_controller

                  return potential if @character_controller.combat_controller.target_is?(assailant_controller)

                  non_target_assailants =  @character_controller.combat_controller.non_target_assailants

                  non_target_assailants.index(assailant_controller) < total_non_target_assailants_blocked ? potential : 0
                end.sum
              end

              def melee_defensive_flanking_modifier(assailant_controller)
                return 0 unless @character_controller.combat_controller.is_attacking?

                @character_controller.combat_controller.target_is?(assailant_controller) ? 0 : -15
              end

              def melee_defensive_position_modifier
                return -50 if @character_controller.position_controller.is_resting?
                return -40 if @character_controller.position_controller.is_sitting?
                0
              end

              private

              def total_non_target_assailants_blocked(item_controller)
                value  = item_controller.shield_stat_controller.max_opponents_blocked
                value -= 1 if @character_controller.combat_controller.is_attacking?
              end

            end

          end

        end

      end

    end

  end

end
