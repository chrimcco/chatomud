module ChatoMud

  module Mixins

    module Actions

      module Checks

        module Types

          def check_is_weapon(target_controller, message)
            unless target_controller.is_weapon?
              tx(message) if message
              return false
            end
            true
          end

          def check_is_melee_weapon(target_controller, message)
            return false unless check_is_weapon(target_controller, message)
            unless target_controller.weapon_stat_controller.is_melee?
              tx(message)
              return false
            end
            true
          end

          def check_is_ranged_weapon(target_controller, message)
            return false unless check_is_weapon(target_controller, message)
            unless target_controller.weapon_stat_controller.is_ranged?
              tx(message)
              return false
            end
            true
          end

          def check_is_not_ranged_weapon(target_controller, message)
            return true unless check_is_weapon(target_controller, nil)
            if target_controller.weapon_stat_controller.is_ranged?
              tx(message)
              return false
            end
            true
          end

          def check_is_container(target_controller)
            unless target_controller.is_container?
              tx("#{target_controller.short_desc} is not a container.")
              return false
            end
            true
          end

          def check_is_stackable(item_controller)
            unless item_controller.is_stackable?
              tx("#{item_controller.short_desc} is not a stack.")
              return false
            end
            true
          end

          def check_is_drinkable(item_controller)
            unless item_controller.is_drinkable?
              tx("You cannot drink from #{item_controller.short_desc}.")
              return false
            end
            true
          end

          def check_is_edible(item_controller)
            unless item_controller.is_edible?
              tx("You cannot eat #{item_controller.short_desc}.")
              return false
            end
            true
          end

          def check_is_missile(target_controller, destination_controller)
            unless target_controller.is_missile?
              tx("You cannot stow #{target_controller.short_desc} inside #{destination_controller.short_desc}.")
              return false
            end
            true
          end

        end

      end

    end

  end

end
