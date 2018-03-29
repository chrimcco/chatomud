module ChatoMud

  module Mixins

    module Actions

      module Checks

        module General

          def check_target_present(target_controller, message)
            unless target_controller
              tx(message) if message
              return false
            end
            true
          end

          def check_target_not_present(target_controller, message)
            if target_controller
              tx(message) if message
              return false
            end
            true
          end

          def check_count_is_positive(target_controllers, message)
            unless target_controllers.count > 0
              tx(message) if message
              return false
            end
            true
          end

        end

      end

    end

  end

end
