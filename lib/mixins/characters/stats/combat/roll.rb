module ChatoMud

  module Mixins

    module Characters

      module Stats

        module Combat

          module Roll

            # unmodified roll: 1-100
            # modified roll: unmodified roll + offensive bonus
            # adjusted roll: modified roll - defensive bonus
            def roll_attack(target_controller, skill_name, melee_weapon_controller, modifier)
              unmodified_roll  = rand(1..100)
              modified_roll = unmodified_roll + modifier

              target_defensive_capabilities = target_controller.stats_controller.melee_defensive_capabilities(@character_controller)

              adjusted_roll = modified_roll - target_defensive_capabilities[:total]

              body_part = self.class.all_body_parts.sample

              against = target_controller.inventory_controller.armor_level_for(body_part)

              attack = attack_referrer.find(skill_name, adjusted_roll, against)

              miss_reason = :not_applicable

              unless attack.connects
                maximum_miss_score = attack_referrer.maximum_miss_score(skill_name, against)
                puts "Got attack score of #{adjusted_roll} (#{unmodified_roll} + #{modifier} - #{target_defensive_capabilities[:total]}), skill #{skill_name} against #{against}, need more than #{maximum_miss_score}"
                miss_reason = :total_miss
                [:stance, :quickness, :shield, :parry, :dodge].each do |capability|
                  maximum_miss_score -= target_defensive_capabilities[capability]
                  puts "Substract #{target_defensive_capabilities[capability]}, #{maximum_miss_score} left."
                  if maximum_miss_score < adjusted_roll
                    miss_reason = capability
                    break
                  end
                end
              end

              {
                body_part: body_part,
                against: against,
                attack: attack,
                melee_weapon_controller: melee_weapon_controller,
                miss_reason: miss_reason
              }
            end

          end

        end

      end

    end

  end

end
