module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_drink(params)
            emitter = params[:emitter]
            target   = params[:target]
            amount  = params[:amount]

            text = interpolate_me_other(emitter, "You drink ", "#{emitter.short_desc} drinks ")

            text << "#{target.drink_controller.taken_portion_description(amount)} #{target.drink_controller.fluid} from #{target.short_desc}."

            tx(text)
          end

        end

      end

    end

  end

end