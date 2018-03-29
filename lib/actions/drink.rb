module ChatoMud

  module Actions

    class Drink < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]
        ground = set_ground
        amount = min_amount(1)

        return unless check_is_valid_amount(amount)

        if ground
          item_controller = @character_controller.search_item_controller(target, :room)
        else
          item_controller = @character_controller.search_item_controller(target, :held_or_room)
        end

        return unless check_target_present(item_controller, "You cannot find the '#{target[:word]}' to drink from.")

        return unless check_is_drinkable(item_controller)

        return unless check_amount_is_positive(item_controller.drink_controller, "#{item_controller.short_desc} is empty.")

        return unless check_has_amount_of_at_least(item_controller.drink_controller, amount, "You cannot drink that much from #{item_controller.short_desc}.")

        interrupt_ranged_weapon_handling

        room_controller.emit_action_echo('drink', { emitter: @character_controller, target: item_controller, amount: amount })
        item_controller.drink_controller.consume(amount)
      end

    end

  end

end