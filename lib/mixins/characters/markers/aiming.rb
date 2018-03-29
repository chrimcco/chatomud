module ChatoMud

  module Mixins

    module Characters

      module Markers

        module Aiming

          def aim_marker
            case @aim_controller.aim_stage
              when :not_aiming
                ""
              when :low
                "<" << "aiming".yellow << ">"
              when :medium
                "<" << "aiming".light_yellow << ">"
              when :high
                "<" << "aiming".red << ">"
              when :aimed
                "<" << "aimed".light_red << ">"
              else
                raise "unknown aim stage"
            end
          end

        end

      end

    end

  end

end
