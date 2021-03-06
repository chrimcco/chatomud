module ChatoMud

  module Actions

    class OpenDoor < BaseAction

      def exec
        return unless can_perform?([:unconscious, :sitting_or_resting])

        direction = set_direction

        door_controller = set_door(direction)

        return unless check_target_present(door_controller, "There is no door leading #{direction}wards.")

        return unless check_must_be_closed(door_controller, "#{door_controller.long_desc} is already open.")

        if check_is_lockable(door_controller, nil)
          return unless check_is_unlocked(door_controller.lock_controller, "#{door_controller.long_desc} is locked.")
        end

        interrupt_ranged_weapon_handling

        door_controller.open
        room_controller.emit_action_echo("open_door", { emitter: @character_controller, target: door_controller, direction: direction })
        room_controller.send("room_#{direction}").emit_action_echo('open_door_other_side', { door: door_controller })
      end

    end

  end

end