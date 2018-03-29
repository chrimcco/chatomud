module ChatoMud

  module Spawners

    module Factories

      class ItemsFactory

        def initialize(server)
          @server = server
        end

        def instantiate(item_template)
          basic_attributes = item_template.attributes.symbolize_keys.except(:id, :created_at, :updated_at, :code)
          item = Item.new(basic_attributes)

          item.inventory = @server.inventories_factory.instantiate(item_template.inventory_template) if item_template.inventory_template

          item.weapon_stat = @server.weapon_stats_factory.instantiate(item_template.weapon_stat_template) if item_template.weapon_stat_template

          item.armor_stat = @server.armor_stats_factory.instantiate(item_template.armor_stat_template) if item_template.armor_stat_template

          item.missile_stat = @server.missile_stats_factory.instantiate(item_template.missile_stat_template) if item_template.missile_stat_template

          item.shield_stat = @server.shield_stats_factory.instantiate(item_template.shield_stat_template) if item_template.shield_stat_template

          %w(stack food drink).each do |amount_key|
            amount = item_template.send(amount_key)
            if amount
              amount_attributes = amount.attributes.symbolize_keys.except(:id, :created_at, :updated_at, :stackable, :edible, :drinkable)
              item.send(amount_key + '=', Amount.new(amount_attributes))
            end
          end

          item.item_template = item_template

          item
        end

      end

    end

  end

end
