module ChatoMud

  module Actions

    class EmotedSay < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        room_controller.emit_action_echo('emoted_say', { emitter: @character_controller, emote: @params[:emote], speech: @params[:speech] })
      end

    end

  end

end