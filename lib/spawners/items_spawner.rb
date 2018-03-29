require 'controllers/items/item_controller'

module ChatoMud

  module Spawners

    class ItemsSpawner

      def initialize(server)
        @server = server
      end

      def spawn_corpse(character_controller)
        attributes = {
          short_desc: "the corpse of #{character_controller.short_desc.uncolorize}",
          long_desc: "Here rests the corpse of #{character_controller.short_desc.uncolorize}.",
          full_desc: "This is the corpse of #{character_controller.short_desc.uncolorize}.",
          kwords: ['corpse'],
          inventory: Inventory.new
        }
        spawn_item(ItemTemplate.find_by_code('corpse_01'), attributes, nil, character_controller.room_controller.inventory_controller)
      end

      def spawn_item(item_template, attributes, item_outfit_codes, inventory_controller)
        item = @server.items_factory.instantiate(item_template)

        item.assign_attributes(attributes)

        item_controller = Controllers::Items::ItemController.new(@server, item, inventory_controller)

        @server.items_outfitter.outfit(item_controller, item_outfit_codes) if item_outfit_codes

        item_controller
      end

    end

  end

end