module ChatoMud

  module Mixins

    module Characters

      module Health

        module Mending

          private

          def start_mending
            @mending_thread = Thread.new(self) do |health_controller|
              while true do
                sleep 2
                if wounded?
                  @wound_controllers[0].mend_by(is_conscious? ? 1 : 10 )
                  check_liveness
                end
              end
            end
          end

          def stop_mending
            @mending_thread.terminate
          end

        end

      end

    end

  end

end