module ChatoMud

  module Actions

    class Drop < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]
        amount = min_amount(nil)

        return unless check_is_valid_amount(amount)

        item_controller = @character_controller.search_item_controller(target, :carried)

        return unless check_target_present(item_controller, "You are not holding the '#{target[:word]}'.")

        interrupt_ranged_weapon_handling

        if amount
          return unless check_is_stackable(item_controller)

          return unless check_has_amount_of_at_least(item_controller.stack_controller, amount, "There are not that many of #{item_controller.short_desc}.")

          new_item_controller = handle_spawned_item(item_controller, amount, room_controller.inventory_controller)
          echo(new_item_controller)
        else
          room_controller.inventory_controller.accept_item(item_controller, true)
          echo(item_controller)
        end
      end

      def echo(item_controller)
        room_controller.emit_action_echo('drop', { emitter: @character_controller, target: item_controller })
      end

    end

  end

end