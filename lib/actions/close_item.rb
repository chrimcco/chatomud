module ChatoMud

  module Actions

    class CloseItem < BaseAction

      def exec
        return unless can_perform?([:unconscious])
        
        target = @params[:target]
        ground = set_ground

        item_controller = @character_controller.search_item_or_furniture_controller(target, ground)

        return unless check_target_present(item_controller, "You cannot find the '#{target[:word]}'.")

        return unless check_is_container(item_controller)

        return unless check_is_closable(item_controller.inventory_controller, "#{item_controller.short_desc} cannot be closed.")

        return unless check_must_be_open(item_controller.inventory_controller.lid_controller, "#{item_controller.short_desc} is already closed.")

        interrupt_ranged_weapon_handling

        item_controller.inventory_controller.lid_controller.close
        room_controller.emit_action_echo('close_item', { emitter: @character_controller, target: item_controller })
      end

    end

  end

end