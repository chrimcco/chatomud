module ChatoMud

  module Mixins

    module Characters

      module Health

        module QuickStatus

          def quick_status
            health_bar = craft_bar(hits, max_hits, "*")

            exhaustion_bar = " |".green << "||".yellow << "||".red

            "<#{health_bar}##{exhaustion_bar}>#{hits}/#{max_hits}#{@character_controller.aim_marker}"
          end

          private

          def craft_bar(current, max, char)
            mn = marks_number(current, max)

            result = ""
            6.step(1, -1) do |n|
              if n <= mn
                result << char.send("#{mark_color(n)}")
              else
                result << " "
              end
            end

            result
          end

          def mark_color(n)
            return "red" if n <= 2
            return "yellow" if n <= 4
            return "green"
          end

          def marks_number(current, max)
            percentage = ((current / max.to_f) * 100).round

            return 0 if percentage <= 0

            return case percentage
              when 1..20
                1
              when 21..40
                2
              when 41..60
                3
              when 61..80
                4
              when 81..99
                5
              when 100
                6
              else
                raise "marks number over 100%"
            end
          end

        end

      end

    end

  end

end
