require 'mixins/directions/utils'

require 'actions/look_around'

module ChatoMud

  module Controllers

    module Characters

      class WalkingController

        include Mixins::Directions::Utils

        def initialize(server, character_controller)
          @server = server
          @character_controller = character_controller
          @walking_thread = nil
        end

        def bye
          stop_walking
        end

        def start_walking(direction, new_room_controller)
          @walking_thread = Thread.new(self, @character_controller, direction, new_room_controller) do |walking_controller, character_controller, direction, new_room_controller|
            sleep(3)
            current_room = @character_controller.room_controller
            door_controller = current_room.send("door_" + direction.to_s)
            if door_controller && door_controller.is_closed?
              current_room.emit_action_echo('stop_closed_door', { emitter: character_controller, door_controller: door_controller })  
            else
              new_room_controller.accept_character(character_controller, true)
              Actions::LookAround.new(@server, @character_controller, nil).exec
              from = opposite_as_from(direction)
              new_room_controller.emit_action_echo('arrival', { emitter: character_controller, from: from })
            end
          end
        end

        def is_walking?
          !!@walking_thread && @walking_thread.alive?
        end

        def stop_walking
          @walking_thread.terminate if @walking_thread
          @walking_thread = nil
        end

      end

    end

  end

end