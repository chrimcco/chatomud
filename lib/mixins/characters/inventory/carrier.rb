module ChatoMud

  module Mixins

    module Characters

      module Inventory

        module Carrier

          def carried_item_controllers
            held_item_controllers + wielded_item_controllers
          end

          def is_carrying_anything?
            carried_item_controllers.any?
          end

          def drop_carried_items
            carried_item_controllers.each do |item_controller|
              @owner_controller.room_controller.inventory_controller.accept_item(item_controller, true)
            end
          end

        end

      end

    end

  end

end