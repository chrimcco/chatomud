module ChatoMud

  module Actions

    class Direction < BaseAction

      def exec
        return unless can_perform?([:unconscious, :sitting_or_resting])

        direction = @params[:towards].keys[0]
        emote     = @params[:emote]

        interrupt_ranged_weapon_handling

        if @character_controller.walking_controller.is_walking?
          @character_controller.walking_controller.stop_walking

          room_controller.emit_action_echo('turn_around', { emitter: @character_controller })
        else
          new_room_controller = room_controller.send("room_#{direction}")

          return unless check_target_present(new_room_controller, "You cannot go that way.")

          room_controller.emit_action_echo('direction', { emitter: @character_controller, direction: direction, new_room_controller: new_room_controller, emote: emote })

          @character_controller.walking_controller.start_walking(direction, new_room_controller)
        end

      end

    end

  end

end