require 'mixins/timers/calendar/definition'
require 'sun_times'

module ChatoMud

  module Mixins

    module Timers

      module Calendar

        module Utils

          include Timers::Calendar::Definition

          def day_period_change_echo(old_data, new_data)
            old_data_period_name = day_period_name(old_data[:ig_time], old_data[:day_minute])
            new_data_period_name = day_period_name(new_data[:ig_time], new_data[:day_minute])

            if old_data_period_name == "late at night" && new_data_period_name == "before dawn"
              return :before_dawn
            end

            if old_data_period_name == "before dawn" && new_data_period_name == "dawn"
              return :dawn
            end

            if old_data_period_name == "late afternoon" && new_data_period_name == "dusk"
              return :dusk
            end

            if old_data_period_name == "late morning" && new_data_period_name == "midday"
              return :midday
            end

            if old_data_period_name == "dusk" && new_data_period_name == "evening"
              return :evening
            end

            nil
          end

          private

          def day_period_name(ig_time, day_minute)
            sun_times = SunTimes.new

            sunrise = sun_times.rise(ig_time, LATITUDE, LONGITUDE)
            sunrise_minutes = sunrise.hour * RL_MIN_PER_HOUR + sunrise.min

            sunset = sun_times.set(ig_time, LATITUDE, LONGITUDE)
            sunset_minutes = sunset.hour * RL_MIN_PER_HOUR + sunset.min

            morning_start = sunrise_minutes + 30
            morning_duration = 690 - morning_start
            morning_periods = [morning_start + morning_duration / 3, morning_start + (2 * morning_duration) / 3]

            afternoon_duration = sunset_minutes - 30 - 750
            afternoon_periods = [750 + afternoon_duration / 3, 750 + (2 * afternoon_duration) / 3]

            case day_minute
              when 0..20
                "midnight"
              when 21..90
                "after midnight"
              when 91..(sunrise_minutes - 45)
                "late at night"
              when (sunrise_minutes - 45)..(sunrise_minutes -1)
                "before dawn"
              when sunrise_minutes..morning_start
                "dawn"
              when morning_start..morning_periods[0]
                "early morning"
              when morning_periods[0]..morning_periods[1]
                "morning"
              when morning_periods[1]..690
                "late morning"
              when 690..750
                "midday"
              when 751..afternoon_periods[0]
                "early afternoon"
              when afternoon_periods[0]..afternoon_periods[1]
                "afternoon"
              when afternoon_periods[1]..(sunset_minutes - 30)
                "late afternoon"
              when (sunset_minutes - 30)..sunset_minutes
                "dusk"
              when sunset_minutes..(sunset_minutes + 30)
                "evening"
              when (sunset_minutes + 30)..1380
                "night-time"
              when 1381..1420
                "before midnight"
              when 1421..1440
                "midnight"
              else
                raise "invalid day minute"
            end
          end

          def day_name(year_day)
            case year_day
              when 0
                full_day_name(year_day, "Yestare", true)
              when 1..30
                full_day_name(year_day, "Narvinye", false)
              when 31..60
                full_day_name(year_day, "Nenime", false)
              when 61..90
                full_day_name(year_day, "Sulime", false)
              when 91
                full_day_name(year_day, "Tuilere", true)
              when 92..121
                full_day_name(year_day, "Viresse", false)
              when 122..151
                full_day_name(year_day, "Lotesse", false)
              when 152..181
                full_day_name(year_day, "Narie", false)
              when 182
                full_day_name(year_day, "Leende", true)
              when 183..212
                full_day_name(year_day, "Cermie", false)
              when 213..242
                full_day_name(year_day, "Urime", false)
              when 243..272
                full_day_name(year_day, "Yavannie", false)
              when 273
                full_day_name(year_day, "Yaviere", true)
              when 274..303
                full_day_name(year_day, "Narquelie", false)
              when 304..333
                full_day_name(year_day, "Hisime", false)
              when 334...363
                full_day_name(year_day, "Ringare", false)
              when 364
                full_day_name(year_day, "Mettare", true)
              else
                raise "invalid year day"
            end
          end

          def full_day_name(year_day, month_name, is_leap_day)
            return month_name if is_leap_day

            "the #{month_day(year_day).ordinalize} of #{month_name}"
          end

          def month_day(year_day)
            return 1 if [0, 91, 182, 273, 364].include?(year_day)

            return year_day -   0 if year_day < 31
            return year_day -  30 if year_day < 61
            return year_day -  60 if year_day <  91
            return year_day -  91 if year_day < 122
            return year_day - 121 if year_day < 152
            return year_day - 151 if year_day < 182
            return year_day - 182 if year_day < 213
            return year_day - 212 if year_day < 243
            return year_day - 242 if year_day < 273
            return year_day - 273 if year_day < 304
            return year_day - 303 if year_day < 334
            return year_day - 333
          end

          def month_number(year_day)
            case year_day
              when 0..30
                1
              when 31..60
                2
              when 61..90
                3
              when 91..121
                4
              when 122..151
                5
              when 152..181
                6
              when 182..212
                7
              when 213..242
                8
              when 243..272
                9
              when 273..303
                10
              when 304..333
                11
              when 334..364
                12
              else
                raise "invalid year day"
            end
          end

        end

      end

    end

  end

end
