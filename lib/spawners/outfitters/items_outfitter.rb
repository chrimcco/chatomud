module ChatoMud

  module Spawners

    module Outfitters

      class ItemsOutfitter

        def initialize(server)
          @server = server
        end

        def outfit(item_controller, item_template_codes)
          item_template_codes.each do |itc|
            if itc.is_a?(Hash)
              itc.keys.each do |key|
                new_item_controller = @server.items_spawner.spawn_item(ItemTemplate.find_by_code(key), {}, nil, item_controller.inventory_controller)
                outfit(new_item_controller, itc[key])
              end
            elsif itc.is_a?(Array)
               itc.each do |code|
                outfit(item_controller, [code])
               end
            elsif itc.is_a?(Symbol)
              @server.items_spawner.spawn_item(ItemTemplate.find_by_code(itc), {}, nil, item_controller.inventory_controller)
            end
          end
        end

      end

    end

  end

end


