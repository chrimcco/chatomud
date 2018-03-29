module ChatoMud

  module Actions

    class LookAtOnAnother < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        character = @params[:character]
        target = @params[:target] 

        character_controller = @character_controller.search_character_controller(character)

        return unless check_target_present(character_controller, "You do not see that person.")

        target_controller = character_controller.search_item_controller(target, :in_inventory)

        return unless check_target_present(target_controller, "#{character_controller.short_desc} does not seem to own the '#{target[:word]}'")

        show_details = character_controller == @character_controller
        tx("#{target_controller.short_desc} (#{target_controller.location(@character_controller)}):\n#{target_controller.full_desc(show_details)}")
      end

    end

  end

end
