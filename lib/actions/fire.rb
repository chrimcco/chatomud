module ChatoMud

  module Actions

    class Fire < BaseAction

      def exec
        return unless can_perform?([:unconscious, :sitting_or_resting, :in_combat])

        return unless check_is_aiming(@character_controller, "You need to aim first.")

        room_controller.emit_action_echo('fire', { emitter: @character_controller })

        @character_controller.aim_controller.fire
      end

    end


  end

end
