module ChatoMud

  module Mixins

    module Characters

      module Inventory

        module ShieldUser

          def shield_item_controllers
            held_item_controllers.select do |item_controller|
              item_controller.is_shield?
            end
          end

        end

      end

    end

  end

end
