require 'mixins/characters/stats/combat/roll'

module ChatoMud

  module Mixins

    module Characters

      module Combat

        module DamageDealer

          include Stats::Combat::Roll

          def perform_melee_attack(target_controller)
            melee_offensive_capabilities = @character_controller.stats_controller.melee_offensive_capabilities

            melee_offensive_capabilities.each do |melee_offensive_capability|
              melee_weapon_controller = melee_offensive_capability[:melee_weapon_controller]
              modifier                = melee_offensive_capability[:modifier]
              skill_name              = melee_offensive_capability[:skill_name]
              
              attack_result = roll_attack(target_controller, skill_name, melee_weapon_controller, modifier)

              target_controller.combat_controller.receive_melee_attack(attack_result[:attack], attack_result[:body_part])

              room_controller.emit_action_echo('melee_attack', { assailant: @character_controller, target: target_controller, attack_result: attack_result })

              target_controller.health_controller.check_liveness

              break if target_controller.health_controller.is_knocked_out?
            end

            handle_knocked_out_opponent if target_controller.health_controller.is_knocked_out?
          end

          def perform_ranged_attack(target_controller)
            ranged_offensive_capability = @character_controller.stats_controller.ranged_offensive_capabilities[0]

            ranged_weapon_controller = ranged_offensive_capability[:ranged_weapon_controller]
            skill_name = ranged_offensive_capability[:skill_name]
            modifier   = ranged_offensive_capability[:modifier]

            missile_controller = ranged_weapon_controller.weapon_stat_controller.ranged_stat_controller.inventory_controller.loaded_missile_controller

            attack_result = attack_roll(target_controller, skill_name, modifier)

            target_controller.combat_controller.receive_ranged_attack(attack_result[:attack], attack_result[:body_part], missile_controller)

            target_controller.room_controller.emit_action_echo('ranged_attack', { target: target_controller, attack: roll[:attack], missile: missile_controller, body_part: roll[:body_part], against: roll[:against] })

            target_controller.health_controller.check_liveness
          end

        end

      end

    end

  end

end