module ChatoMud

  module Actions

    class Put < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target       = @params[:target]
        destination  = @params[:destination]
        @amount      = min_amount(nil)
        ground       = !!@params[:ground]

        @target_controller = @character_controller.search_item_controller(target, :carried)

        return unless check_target_present(@target_controller, "You are not holding the '#{target[:word]}'.")

        interrupt_ranged_weapon_handling

        @destination_controller = @character_controller.search_item_or_furniture_controller(destination, ground)

        return unless check_target_present(@destination_controller, "You cannot find the '#{destination[:word]}'.")

        return unless check_no_equality(@target_controller, @destination_controller, "You cannot put #{@target_controller.short_desc} inside itself.")

        if @destination_controller.is_item_controller?
          return unless check_is_not_ranged_weapon(@destination_controller, "Use 'load' for loading ranged weapons.")

          if @destination_controller.is_quiver?
            return unless check_is_missile(@target_controller, @destination_controller)
            do_put_no_amount
            return
          elsif @destination_controller.is_sheath?
            return unless check_is_melee_weapon(@target_controller, "You cannot sheathe #{@target_controller.short_desc}.")
            return unless check_has_no_content(@destination_controller.inventory_controller, "#{@destination_controller.short_desc} is already bearing #{@destination_controller.inventory_controller.list_inventory(:short_desc)}.")
            do_put_no_amount
            return
          end
        end

        return unless check_is_container(@destination_controller)

        if check_is_closable(@destination_controller.inventory_controller, nil)
          return unless check_must_be_open(@destination_controller.inventory_controller.lid_controller, "#{@destination_controller.short_desc} is closed.")
        end

        do_put_amount        if @amount
        do_put_no_amount unless @amount

      end

      private

      def do_put_amount
        return unless check_is_stackable(@target_controller)

        return unless check_has_amount_of_at_least(@target_controller.stack_controller, @amount, "There are not that many of #{@target_controller.short_desc} to deposit.")

        new_target_controller = handle_spawned_item(@target_controller, @amount, @destination_controller.inventory_controller)
        echo(new_target_controller)
      end

      def do_put_no_amount
        @destination_controller.inventory_controller.accept_item(@target_controller, true)
        echo(@target_controller)
      end

      def echo(target_controller)
        room_controller.emit_action_echo('put', { emitter: @character_controller, destination: @destination_controller, target: target_controller })
      end

    end

  end

end