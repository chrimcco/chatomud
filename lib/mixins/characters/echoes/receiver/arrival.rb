module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_arrival(params)
            emitter   = params[:emitter]
            from = params[:from]

            return if emitter == self

            text = "#{emitter.short_desc} is arriving from #{from}."

            tx(text)
          end

        end

      end

    end

  end

end