module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_ranged_attack(params)
            target    = params[:target]
            attack    = params[:attack]
            missile   = params[:missile]
            body_part = params[:body_part]
            against   = params[:against]


            unless attack.connects
              text  = "#{missile.short_desc}"
              text << interpolate_me_other(target, " misses you.", " misses #{target.short_desc}.")
              tx(text)
              return
            end

            text  = "#{missile.short_desc} lodges in "

            text << interpolate_me_other(target, "your #{body_part}.", "the #{body_part} of #{target.short_desc}.")

            if attack.is_critical?
              text << " Critical severity: #{attack.critical_severity}, type: #{attack.critical_type}."
            else
              text << " Not a critical."
            end

            tx(text)
          end

        end

      end

    end

  end

end
