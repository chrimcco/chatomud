module ChatoMud

  module Spawners

    module Factories

      class InventoriesFactory

        def initialize(server)
          @server = server
        end

        def instantiate(inventory_template)
          inventory_attributes = inventory_template.attributes.symbolize_keys.except(:id, :created_at, :updated_at, :parent_id)
          inventory = Inventory.new(inventory_attributes)

          inventory.lid = @server.lids_factory.instantiate(inventory_template.lid_template) if inventory_template.lid_template

          inventory
        end

      end

    end

  end

end
