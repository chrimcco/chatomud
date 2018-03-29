module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_stop_aiming(params)
            emitter = params[:emitter]

            text = interpolate_me_other(emitter, "You cease aiming.", "#{emitter.short_desc} ceases aiming.")

            tx(text)
          end

        end

      end

    end

  end

end