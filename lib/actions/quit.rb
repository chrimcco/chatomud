module ChatoMud

  module Actions

    class Quit < BaseAction

      def exec
        return unless can_perform?([:in_combat])

        if @character_controller.is_npc?
          tx("NPCs are not allowed to quit.")
          return
        end
       
        interrupt_ranged_weapon_handling
        
        @character_controller.entity_controller.handle_leave_game
      end

    end

  end

end