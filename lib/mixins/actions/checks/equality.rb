module ChatoMud

  module Mixins

    module Actions

      module Checks

        module Equality

          def check_no_equality(first_controller, second_controller, message)
            if first_controller == second_controller
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
