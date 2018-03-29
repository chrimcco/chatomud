module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_open_item(params)
            emitter   = params[:emitter]
            target    = params[:target]

            text = interpolate_me_other(emitter, "You open ", "#{emitter.short_desc} opens ")

            text << "#{target.short_desc}."

            tx(text)
          end

        end

      end

    end

  end

end