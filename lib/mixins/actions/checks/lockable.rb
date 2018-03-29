module ChatoMud

  module Mixins

    module Actions

      module Checks

        module Lockable

          def check_is_lockable(target_controller, message)
            unless target_controller.is_lockable?
              tx(message) if message
              return false
            end
            true
          end

          def check_is_locked(lock_controller, message)
            unless lock_controller.is_locked?
              tx(message)
              return false
            end
            true
          end

          def check_is_unlocked(lock_controller, message)
            unless lock_controller.is_unlocked?
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
