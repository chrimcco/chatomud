module ChatoMud

  module Actions

    class EmptyIntoAnother < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]
        destination = @params[:destination]

        target_item_controller = @character_controller.search_item_controller(target, :carried)

        unless target_item_controller
          tx("You are not holding the '#{target[:word]}'.")
          return
        end

        return unless check_is_container(target_item_controller)

        if check_is_closable(target_controller.inventory_controller, nil)
          return unless check_must_be_open(target_item_controller, "#{target_item_controller.short_desc} is closed.")
        end
        
        unless target_item_controller.inventory_controller.has_content?
          tx("#{target_item_controller.short_desc} is already empty.")
          return
        end

        destination_item_controller = @character_controller.search_item_controller(destination, :anywhere)
        unless destination_item_controller
          tx("Where did you say you want to empty #{target_item_controller.short_desc}?")
          return
        end
        
        return unless check_is_container(destination_item_controller)

        if check_is_closable(destination_item_controller.inventory_controller, nil)
          return unless check_must_be_open(destination_item_controller, "#{destination_item_controller.short_desc} is closed.")
        end

        interrupt_ranged_weapon_handling

        room_controller.emit_action_echo("empty_into_another", { emitter: @character_controller, target: target_item_controller, destination: destination_item_controller })
        target_item_controller.inventory_controller.dump_items_into(destination_item_controller)
      end

    end

  end

end