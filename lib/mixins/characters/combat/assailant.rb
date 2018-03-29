require 'mixins/characters/combat/damage_dealer'

module ChatoMud

  module Mixins

    module Characters

      module Combat

        module Assailant
          include DamageDealer

          def start_combat_thread
            @combat_thread = Thread.new(self) do |combat_controller|
              while true do
                combat_controller.perform_melee_attack(combat_controller.target) if combat_controller.target
                sleep 3
              end
            end
          end

          def is_attacking?
            !!@target
          end

          def target_is?(opponent_controller)
            @target == opponent_controller
          end

          def list_target
            @target.short_desc
          end

          def handle_become_pacifist
            stop_combat(true) if is_attacking?
          end

          def handle_become_belligerent
            if is_being_attacked?
              fight(@assailants[0], false)
            end
          end

          def fight(opponent_controller, is_initiator)
            if is_initiator
              if is_attacking?
                switch_opponent(opponent_controller)
              else
                pick_opponent(opponent_controller)
              end
            else
              handle_fight_back(opponent_controller)
            end
          end

          def stop_combat(echo)
            room_controller.emit_action_echo('stop_combat', { emitter: @character_controller, target: @target }) if echo
            @target.combat_controller.remove_assailant(@character_controller)
            @target = nil
          end

          def bye
            @combat_thread.terminate
          end

          private

          def handle_knocked_out_opponent
            if is_being_attacked?
              switch_opponent(@assailants[0])
            else
              stop_combat(false)
            end
          end

          def switch_opponent(opponent_controller)
            room_controller.emit_action_echo('switch_combat', { emitter: @character_controller, new_target: opponent_controller, old_target: @target })
            @target.combat_controller.remove_assailant(@character_controller)
            set_target(opponent_controller)
            opponent_controller.combat_controller.handle_fight_back(@character_controller)
          end

          def pick_opponent(opponent_controller)
            room_controller.emit_action_echo('start_combat', { emitter: @character_controller, target: opponent_controller })
            set_target(opponent_controller)
            opponent_controller.combat_controller.handle_fight_back(@character_controller)
          end

          def set_target(opponent_controller)
            @target = opponent_controller
          end

        end

      end

    end

  end

end