module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_missile_landing(params)
            emitter = params[:emitter]
            from    = params[:from]
            missile = params[:missile]

            travel_string = from ? "from #{from}, bound for" : "toward"

            text = "#{missile.short_desc} races #{travel_string} "

            text << interpolate_me_other(emitter, "you!", "#{emitter.short_desc}!")

            tx(text)
          end

        end

      end

    end

  end

end