module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_simple_emote(params)
            emitter = params[:emitter]
            emote = params[:emote]
            
            return if (text = interpolate_refs(emote, emitter, true)).nil?

            tx(text)
          end

        end

      end

    end

  end

end