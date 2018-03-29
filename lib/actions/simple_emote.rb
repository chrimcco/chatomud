module ChatoMud

  module Actions

    class SimpleEmote < BaseAction

      def exec
        return unless can_perform?([:unconscious])
        
        room_controller.emit_action_echo('simple_emote', { emitter: @character_controller, emote: @params[:emote] })
      end

    end

  end

end