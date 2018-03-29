module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_direction(params)
            emitter   = params[:emitter]
            direction = params[:direction]
            new_room_controller = params[:new_room_controller]
            emote = params[:emote]

            text = interpolate_me_other(emitter, "You start walking ", "#{emitter.short_desc} starts walking ")

            text << "#{direction}ward"

            if emote
              text << ", #{interpolate_refs(emote, emitter, false)}."
            else
              text << "."
            end

            tx(text)
          end

        end

      end

    end

  end

end