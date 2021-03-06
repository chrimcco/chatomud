require 'controllers/base_controller'

require 'controllers/characters/character_controller'
require 'controllers/rooms/room_controller'
require 'controllers/items/amounts/stack_controller'
require 'controllers/items/amounts/food_controller'
require 'controllers/items/amounts/drink_controller'
require 'controllers/items/weapon_stat_controller'
require 'controllers/items/missile_stat_controller'
require 'controllers/items/armor_stat_controller'
require 'controllers/items/shield_stat_controller'
require 'controllers/inventories/box_inventory_controller'
require 'controllers/inventories/sheath_inventory_controller'
require 'controllers/inventories/quiver_inventory_controller'

require 'mixins/items/wearable'
require 'mixins/items/wieldable'
require 'mixins/describable/item'
require 'mixins/instantiable/item'

module ChatoMud

  module Controllers

    module Items

      class ItemController < BaseController
        attr_reader :inventory_controller
        attr_reader :containing_inventory_controller
        attr_reader :weapon_stat_controller
        attr_reader :missile_stat_controller
        attr_reader :armor_stat_controller
        attr_reader :shield_stat_controller
        attr_reader :stack_controller
        attr_reader :food_controller
        attr_reader :drink_controller

        include Mixins::Items::Wearable
        include Mixins::Items::Wieldable
        include Mixins::Describable::Item
        include Mixins::Instantiable::Item

        def initialize(server, item, containing_inventory_controller)
          @server = server
          @item = item
          containing_inventory_controller.accept_item(self, false)
          if @item.is_sheath
            @inventory_controller = Inventories::SheathInventoryController.new(@server, self, @item.inventory)
          elsif @item.is_quiver
            @inventory_controller = Inventories::QuiverInventoryController.new(@server, self, @item.inventory)
          elsif @item.inventory
            @inventory_controller = Inventories::BoxInventoryController.new(@server, self, @item.inventory)
          else
            @inventory_controller = nil
          end

          @weapon_stat_controller = @item.weapon_stat ? WeaponStatController.new(server, self, @item.weapon_stat) : nil
          @missile_stat_controller = @item.missile_stat ? MissileStatController.new(server, self, @item.missile_stat) : nil
          @armor_stat_controller = @item.armor_stat ? ArmorStatController.new(server, self, @item.armor_stat) : nil
          @shield_stat_controller = @item.shield_stat ? ShieldStatController.new(server, self, @item.shield_stat) : nil

          @stack_controller = @item.stack ? Amounts::StackController.new(self, @item.stack) : nil
          @food_controller = @item.food  ? Amounts::FoodController.new(self, @item.food) : nil
          @drink_controller = @item.drink ? Amounts::DrinkController.new(self, @item.drink) : nil

          @server.items_handler.add_item_controller(self)
        end

        def bye
          if is_container?
            @inventory_controller.bye
          end
          @server.items_handler.remove_item_controller(self)
        end

        def dock_on(new_containing_inventory_controller, new_containing_inventory, remove_from_containing_inventory_controller)
          @containing_inventory_controller.remove_item_controller(self) if remove_from_containing_inventory_controller
          new_containing_inventory_controller.add_item_controller(self)
          @containing_inventory_controller = new_containing_inventory_controller
          @item.containing_inventory = new_containing_inventory
          @item.save!
        end

        def is_sheath?
          !!@inventory_controller && @inventory_controller.is_a?(Inventories::SheathInventoryController)
        end

        def is_quiver?
          !!@inventory_controller && @inventory_controller.is_a?(Inventories::QuiverInventoryController)
        end

        def is_weapon?
          !!@weapon_stat_controller
        end

        def is_missile?
          !!@missile_stat_controller
        end

        def is_armor?
          !!@armor_stat_controller
        end

        def is_shield?
          !!@shield_stat_controller
        end

        def is_container?
          !!@inventory_controller
        end

        def is_stackable?
          !!@stack_controller
        end

        def is_edible?
          !!@food_controller
        end

        def is_drinkable?
          !!@drink_controller
        end

        def is_consumable?
          is_edible? || is_drinkable?
        end

        def in_room?
          @containing_inventory_controller.owner_controller.is_a?(Rooms::RoomController)
        end

        def in_character?
          @containing_inventory_controller.owner_controller.is_a?(Controllers::Characters::CharacterController)
        end

        def in_item?
          @containing_inventory_controller.owner_controller.is_a?(ItemController)
        end

        def container_type
          return :room if in_room?
          return :character if in_character?
          return :item if in_item?
          raise "Unknown container type."
        end

        def junk(remove_from_containing_inventory_controller)
          if is_container?
            @inventory_controller.junk_all
          end
          @containing_inventory_controller.remove_item_controller(self) if remove_from_containing_inventory_controller
          @server.items_handler.remove_item_controller(self)
          @item.destroy
        end

        def destroy
          @item.destroy
        end

        def split_stack_attributes(amount)
          result = {
            stack_attributes: {
              current: amount
            }
          }
          
          if is_edible?
            result[:food_attributes] = {
              current: @food_controller.current
            }
          end

          result
        end

        def slot
          @item.slot.to_sym
        end

        def id
          @item.id
        end

        def model
          @item
        end

      end

    end

  end

end