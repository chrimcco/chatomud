module ChatoMud

  module Actions

    class Possess < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]

        if entity_controller.possession_controller.is_possessed?
          entity_controller.possession_controller.possessing_controller.tx("You cannot possess from a possessed criature.", true)
          return
        end

        if @character_controller.is_npc?
          tx("NPCs are not allowed to possess.")
          return
        end

        character_controller = @character_controller.search_character_controller(target)

        return unless check_target_present(character_controller, "You cannot find that character.")
        
        return unless check_no_equality(@character_controller, character_controller, "You cannot target yourself.")
        
        if character_controller.entity_controller.possession_controller.is_possessing?
          tx("#{character_controller.short_desc} is doing a possession.")
          return
        end

        if character_controller.entity_controller.possession_controller.is_possessed?
          tx("#{character_controller.short_desc} is already possessed.")
          return
        end        

        interrupt_ranged_weapon_handling

        @character_controller.entity_controller.possession_controller.possess(character_controller.entity_controller)
      end

    end

  end

end
