module ChatoMud

  module Actions

    class Junk < BaseAction
      # TODO add amount
      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]

        target_item_controller = @character_controller.search_item_controller(target, :held)

        return unless check_target_present(target_item_controller, "You are not holding that.")

        interrupt_ranged_weapon_handling
        
        tx("You junk #{target_item_controller.short_desc}.")
        target_item_controller.junk(true)
      end

    end

  end

end