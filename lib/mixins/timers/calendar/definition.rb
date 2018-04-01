module ChatoMud

  module Mixins

    module Timers

      module Calendar

        module Definition

          # Oxford, actually.
          LATITUDE  ||= 51.7520
          LONGITUDE ||= 1.2577

          SECS_PER_RL_MINUTE ||= 60
          SECS_PER_RL_HOUR   ||= SECS_PER_RL_MINUTE * 60
          SECS_PER_RL_DAY    ||= SECS_PER_RL_HOUR * 24
          SECS_PER_RL_YEAR   ||= SECS_PER_RL_DAY * 365

          RL_START_YEAR ||= 2017
          IG_START_YEAR ||= 2470 # Steward's Reckoning, Third Age.

          SECS_PER_IG_MINUTE ||= 15
          SECS_PER_IG_HOUR   ||= SECS_PER_IG_MINUTE * 60
          SECS_PER_IG_DAY    ||= SECS_PER_IG_HOUR * 24
          SECS_PER_IG_YEAR   ||= SECS_PER_IG_DAY * 365

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
