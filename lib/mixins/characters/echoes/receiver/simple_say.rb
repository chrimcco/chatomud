module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_simple_say(params)
            emitter = params[:emitter]
            speech  = params[:speech]

            text = interpolate_me_other(emitter, "You say", "#{emitter.short_desc} says")

            text << ":\n  \"#{speech}\""
            tx(text)
          end

        end

      end

    end

  end

end