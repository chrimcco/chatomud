module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_unload(params)
            emitter       = params[:emitter]
            destination   = params[:destination]

            ranged_weapon = emitter.inventory_controller.ranged_weapon_controllers(:held_or_wielded, true)[0]
            missile = ranged_weapon.weapon_stat_controller.ranged_stat_controller.inventory_controller.loaded_missile_controller

            text = interpolate_me_other(emitter, "You unload ", "#{emitter.short_desc} unloads ")

            text << "#{ranged_weapon.short_desc}"

            if destination == :hand
              text << "."
            else
              text << interpolate_me_other(emitter, " and stow", " and stows")
              text << " #{missile.short_desc} back in"
              text << " #{destination.short_desc}."
            end

            tx(text)
          end

        end

      end

    end

  end

end