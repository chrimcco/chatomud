require 'mixins/describable/common'

module ChatoMud

  module Mixins

    # Classes including this module need a #model method which returns the entity they govern.
    module Describable

      module Character

        include Common

        def short_desc
          model.short_desc.magenta
        end
   
        def long_desc
          if combat_controller.is_attacking?
            short_desc + " is here, fighting " + combat_controller.target.short_desc + "."
          elsif !health_controller.is_conscious?
            short_desc + " is lying here, unconscious."
          elsif position_controller.is_resting?
            if position_controller.is_accommodated?
              short_desc + " is resting at #{position_controller.furniture_controller.short_desc}."
            else
              short_desc + " is here, resting on the ground."
            end
          elsif position_controller.is_sitting?
            if position_controller.is_accommodated?
              short_desc + " is sitting at #{position_controller.furniture_controller.short_desc}."
            else
              short_desc + " is here, sitting on the ground."
            end
          elsif load_controller.is_loading?
            short_desc + " is here, loading #{inventory_controller.ranged_weapon_controllers(:wielded, false)[0].short_desc}"
          elsif aim_controller.is_aiming?
            ranged_weapon_controller = inventory_controller.ranged_weapon_controllers(:wielded, true)[0]
            direction = aim_controller.target_info[:direction]
            if direction
              short_desc + " is here, aiming #{aim_controller.target_info[:direction]}ward with #{ranged_weapon_controller.short_desc} ."
            else
              target_controller = aim_controller.target_info[:target]
              short_desc + " is here, aiming at #{target_controller.short_desc} with #{ranged_weapon_controller.short_desc} ."
            end
          else
            model.long_desc.magenta
          end
        end

        def full_desc(gender)
          text = "#{model.full_desc}\n"
          text << "#{list_inventory(gender)}"
          text << "#{list_wounds(gender)}"
          text
        end

      end

    end

  end

end