module ChatoMud

  module Mixins

    module Actions

      module Checks

        module Closable

          def check_is_closable(inventory_controller, message)
            unless inventory_controller.is_closable?
              tx(message) if message
              return false
            end
            true
          end

          def check_must_be_closed(target_controller, message)
            unless target_controller.is_closed?
              tx(message)
              return false
            end
            true
          end

          def check_must_be_open(target_controller, message)
            unless target_controller.is_open?
              tx(message)
              return false
            end
            true
          end

        end

      end

    end

  end

end
