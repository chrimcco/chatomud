module ChatoMud

  module Actions

    class SimpleSpawnItem < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        if @character_controller.is_npc?
          tx("NPCs are not allowed to spawn items.")
          return
        end

        item_template_code = @params[:item_template_code].to_s

        item_template = ItemTemplate.find_by_code(item_template_code)
        unless item_template
          tx("Cannot find item template with code '#{item_template_code}'.")
          return
        end

        item_controller = @server.items_spawner.spawn_item(item_template, {}, nil, @character_controller.room_controller.inventory_controller)
        tx("Spawned #{item_controller.short_desc}.")
      end

    end

  end

end