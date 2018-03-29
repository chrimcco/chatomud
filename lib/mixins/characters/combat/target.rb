module ChatoMud

  module Mixins

    module Characters

      module Combat

        module Target

          def is_being_attacked?
            @assailants.present?
          end

          def receive_melee_attack(attack, body_part)
            health_controller.suffer_melee_attack(attack, body_part) if attack.connects
          end

          def receive_ranged_attack(attack, body_part, missile_controller)
            health_controller.suffer_ranged_attack(attack, body_part, missile_controller) if attack.connects
          end

          def list_assailants
            @assailants.map(&:short_desc).to_sentence
          end

          def non_target_assailants
            @assailants - [@target]
          end

          def handle_fight_back(opponent_controller)
            @character_controller.load_controller.stop_loading
            add_assailant(opponent_controller)
            unless is_attacking? || choice_controller.stance_is?(:pacifist)
              opponent_controller.combat_controller.add_assailant(@character_controller)
              set_target(opponent_controller)
            end
          end

          def add_assailant(assailant_controller)
            @assailants << assailant_controller
          end

          def remove_assailant(assailant_controller)
            @assailants.delete(assailant_controller)
          end

          def handle_unconsciousness
            stop_combat(false) if is_attacking?
          end

        end

      end

    end

  end

end