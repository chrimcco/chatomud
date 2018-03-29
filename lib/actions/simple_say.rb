module ChatoMud

  module Actions

    class SimpleSay < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        room_controller.emit_action_echo('simple_say', { emitter: @character_controller, speech: @params[:speech] })
      end

    end

  end

end