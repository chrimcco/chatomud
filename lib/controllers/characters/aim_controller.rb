require 'mixins/directions/utils'

module ChatoMud

  module Controllers

    module Characters

      class AimController

        include Mixins::Directions::Utils

        attr_reader :target_info
        attr_reader :aim_stage

        def initialize(server, character_controller)
          @server = server
          @character_controller = character_controller
          @aim_thread = nil
          @target_info = nil
          @running = false
          @aim_stage = :not_aiming
        end

        def start_aim_thread(target_info)
          @target_info = target_info
          @running = true
          @aim_stage = :low

          delay = 2

          @aim_thread = Thread.new(target_info, delay) do |target_info, delay|
            sleep delay
            @aim_stage = :medium
            sleep delay
            @aim_stage = :high
            sleep delay
            @aim_stage = :aimed
            Actions::FinishAiming.new(@server, @character_controller, {}).exec
          end
        end

        def is_aiming?
          !!@running
        end

        def bye
          stop_aiming
        end

        def fire
          target_controller = @target_info[:target]
          
          missile_controller = @character_controller.inventory_controller.ranged_weapon_controllers(:wielded, true)[0].weapon_stat_controller.ranged_stat_controller.inventory_controller.loaded_missile_controller
          

          direction = @target_info[:direction]

          if direction
            direction = direction.to_sym

            line_of_sight = @character_controller.room_controller.line_of_sight(direction, @target_info[:distance] - 1)

            line_of_sight.each do |connection|
              connection[0].emit_action_echo('missile_passing', { direction: direction, missile: missile_controller})
            end
          end

          target_controller.room_controller.emit_action_echo('missile_landing', { emitter: target_controller, from: opposite_as_from(direction), missile: missile_controller})

          @character_controller.combat_controller.perform_ranged_attack(target_controller)
        end

        def stop_aiming
          if @running
            done_aiming
            @character_controller.room_controller.emit_action_echo('stop_aiming', { emitter: @character_controller })
          end
        end

        def done_aiming
          @target_info = nil
          @running = false
          @aim_thread.terminate
          @aim_stage = :not_aiming
        end

      end

    end

  end

end