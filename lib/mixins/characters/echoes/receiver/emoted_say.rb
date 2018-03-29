module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_emoted_say(params)
            emitter = params[:emitter]
            emote   = params[:emote]
            speech  = params[:speech]

            text = interpolate_me_other(emitter, "You say, ", "#{emitter.short_desc} says, ")

            return if (text << interpolate_refs(emote, emitter, false)).nil?

            text << ",\n  \"#{speech}\"" 

            tx(text)
          end

        end

      end

    end

  end

end