module ChatoMud

  module Mixins

    module Characters

      module Health

        module Liveness

          def is_conscious?
            !!@conscious
          end

          def is_dead?
            hits <= death_hits
          end

          def is_knocked_out?
            !is_conscious? || is_dead?
          end

          def check_liveness
            if is_dead?
              @character_controller.die
              return
            end
            
            if hits <= unconsciousness_hits
              fall_unconscious if @conscious
            else
              regain_consciousness unless @conscious
            end
          end

          private

          def death_hits
            -300 - attribute_bonus_referrer.find(stats_controller.attribute_value(:con)).bonus
          end

          def unconsciousness_hits
            hits * 0.1
          end

          def fall_unconscious
            @conscious = false
            @character_controller.fall_unconscious
          end

          def regain_consciousness
            @conscious = true
            @character_controller.regain_consciousness
          end

        end

      end

    end

  end

end