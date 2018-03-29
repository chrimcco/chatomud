module ChatoMud

  module Mixins

    module Characters

      module Inventory

        module Armored

          def armor_controllers_for(body_part)
            result = []
            armor_item_controllers.each do |item_controller|
              result << item_controller if item_controller.armor_stat_controller.body_parts.include?(body_part)
            end

            result
          end

          def armor_level_for(body_part)
            armor_controllers_for(body_part).map do |armor_controller|
              armor_controller.armor_stat_controller.level
            end.max || 1
            # TODO do some sort of calculation for overlapping protection levels
          end

          def list_armor
            result = "Your armor:\n"
            self.class.all_body_parts.each do |body_part|
              result << "#{body_part.to_s}: "
              item_controllers = armor_controllers_for(body_part)
              if item_controllers.empty?
                result << "<none>\n"
              else
                item_controllers.each do |item_controller|
                  result << "#{item_controller.short_desc} (#{item_controller.armor_stat_controller.level})"
                end
                result << "\n"
              end
            end

            result
          end

        end

      end

    end

  end

end
