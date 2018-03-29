module ChatoMud

  module Controllers

    module Characters

      class LoadController

        def initialize(server, character_controller)
          @server = server
          @character_controller = character_controller
          @load_thread = nil
          @running = false
        end

        def start_load_thread(missile_controller, from)
          @missile_controller = missile_controller
          @running = true

          delay = 5
          # TODO load_controller needed?
          @load_thread = Thread.new(self, missile_controller, from, delay) do |load_controller, missile_controller, from, delay|
            sleep delay
            Actions::FinishLoading.new(@server, @character_controller, { missile: missile_controller, from: from }).exec
            
          end
        end

        def is_loading?
          !!@running
        end

        def is_holding_load?
          loaded_ranged_weapon_controller = @character_controller.inventory_controller.ranged_weapon_controllers(:wielded, true)[0]

          loaded_ranged_weapon_controller ? !loaded_ranged_weapon_controller.weapon_stat_controller.ranged_stat_controller.can_remain_loaded? : false
        end

        def bye
          stop_loading
        end

        def stop_loading
          if is_loading?
            @character_controller.room_controller.emit_action_echo('stop_loading', { emitter: @character_controller })
          end
          done_loading
        end

        def done_loading
          @missile_controller = nil
          @running = false
          @load_thread.terminate if @load_thread
        end

      end

    end

  end

end