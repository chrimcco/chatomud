module ChatoMud

  module Mixins

    module Actions

      module Checks

        module Amounts

          def check_is_valid_amount(amount)
            if amount && amount < 1
              tx('Please provide a valid amount.')
              return false
            end
            true
          end

          def check_has_amount_of(amount_controller, count, message)
            unless amount_controller.current == count
              tx(message) if message
              return false
            end
            true
          end

          def check_has_amount_of_at_least(amount_controller, amount, message)
            unless amount_controller.has_at_least?(amount)
              tx(message) if message
              return false
            end
            true
          end

          def check_amount_is_positive(amount_controller, message)
            unless amount_controller.has_some?(amount)
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
