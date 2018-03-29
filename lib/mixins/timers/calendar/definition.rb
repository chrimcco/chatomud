module ChatoMud

  module Mixins

    module Timers

      module Calendar

        module Definition

          # Oxford, actually.
          LATITUDE  ||= 51.7520
          LONGITUDE ||= 1.2577

          RL_SEC_PER_MINUTE ||= 60

          RL_MIN_PER_HOUR ||= 60

          RL_SEC_PER_HOUR ||= RL_SEC_PER_MINUTE * RL_MIN_PER_HOUR

          RL_SEC_PER_DAY ||= RL_SEC_PER_HOUR * 24


          RL_START_YEAR ||= 2017


          IG_SEC_PER_YEAR ||= ((365 / 4.0) * 24 * 60 * 60).round

          IG_START_YEAR ||= 2470 # Steward's Reckoning, Third Age.

          def all_day_portions
            [
              :after_midnight
            ]
          end

        end

      end

    end

  end

end
