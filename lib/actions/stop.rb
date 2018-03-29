module ChatoMud

  module Actions

    class Stop < BaseAction
      def exec
        return unless can_perform?([:unconscious])

        return if interrupt_transient_ranged_weapon_handling

        unless @character_controller.combat_controller.is_attacking?
          tx("You are not performing any specific activity.")
          return
        end

        @character_controller.combat_controller.stop_combat(true)
      end

    end

  end

end
