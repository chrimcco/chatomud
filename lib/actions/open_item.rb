module ChatoMud

  module Actions

    class OpenItem < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]
        ground = set_ground

        item_controller = @character_controller.search_item_or_furniture_controller(target, ground)

        return unless check_target_present(item_controller, "You cannot find the '#{target[:word]}'.")

        return unless check_is_container(item_controller)

        return unless check_is_closable(item_controller.inventory_controller, "#{item_controller.short_desc} cannot be opened.")

        return unless check_must_be_closed(item_controller.inventory_controller.lid_controller, "#{item_controller.short_desc} is already open.")

        if check_is_lockable(item_controller.inventory_controller.lid_controller, nil)
          return unless check_is_unlocked(item_controller.inventory_controller.lid_controller.lock_controller, "#{item_controller.short_desc} is locked.")
        end

        interrupt_ranged_weapon_handling

        item_controller.inventory_controller.lid_controller.open
        room_controller.emit_action_echo('open_item', { emitter: @character_controller, target: item_controller })
      end

    end

  end

end