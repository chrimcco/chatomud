require 'mixins/timers/calendar/definition'
require 'sun_times'

module ChatoMud

  module Mixins

    module Timers

      module Calendar

        module Utils

          include Timers::Calendar::Definition

          def day_period_change_echo(old_data, new_data)
            old_data_period_name = day_period_name(old_data)
            new_data_period_name = day_period_name(new_data)

            if old_data_period_name == "late at night"  && new_data_period_name == "before dawn"
              return :before_dawn
            end

            if old_data_period_name == "before dawn"    && new_data_period_name == "dawn"
              return :dawn
            end

            if old_data_period_name == "late afternoon" && new_data_period_name == "dusk"
              return :dusk
            end

            if old_data_period_name == "late morning"   && new_data_period_name == "midday"
              return :midday
            end

            if old_data_period_name == "dusk"           && new_data_period_name == "evening"
              return :evening
            end

            nil
          end

          def time_from_data(time_data)
            DateTime.new(Time.new.year,
                         time_data[:month],
                         time_data[:mday],
                         time_data[:hour],
                         time_data[:hminute],
                         time_data[:second])
          end

          private

          def day_period_name(time_data)
            sun_times = SunTimes.new

            time = time_from_data(time_data)

            sunrise = sun_times.rise(time, LATITUDE, LONGITUDE)
            sunrise_minutes = sunrise.hour * 60 + sunrise.min

            sunset = sun_times.set(time, LATITUDE, LONGITUDE)
            sunset_minutes = sunset.hour * 60 + sunset.min

            morning_start = sunrise_minutes + 30
            morning_duration = 690 - morning_start
            morning_periods = [morning_start + morning_duration / 3, morning_start + (2 * morning_duration) / 3]

            afternoon_duration = sunset_minutes - 30 - 750
            afternoon_periods = [750 + afternoon_duration / 3, 750 + (2 * afternoon_duration) / 3]

            case time_data[:dminute]
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
              when 1
                full_day_name(year_day, "Yestare", true)
              when 2..31
                full_day_name(year_day, "Narvinye", false)
              when 32..61
                full_day_name(year_day, "Nenime", false)
              when 62..91
                full_day_name(year_day, "Sulime", false)
              when 92
                full_day_name(year_day, "Tuilere", true)
              when 93..122
                full_day_name(year_day, "Viresse", false)
              when 123..152
                full_day_name(year_day, "Lotesse", false)
              when 153..182
                full_day_name(year_day, "Narie", false)
              when 183
                full_day_name(year_day, "Leende", true)
              when 184..213
                full_day_name(year_day, "Cermie", false)
              when 214..243
                full_day_name(year_day, "Urime", false)
              when 244..273
                full_day_name(year_day, "Yavannie", false)
              when 274
                full_day_name(year_day, "Yaviere", true)
              when 275..304
                full_day_name(year_day, "Narquelie", false)
              when 305..334
                full_day_name(year_day, "Hisime", false)
              when 335...364
                full_day_name(year_day, "Ringare", false)
              when 365
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
            return 1 if [1, 92, 183, 274, 365].include?(year_day)

            return year_day -   1 if year_day <  31
            return year_day -  31 if year_day <  61
            return year_day -  61 if year_day <  91
            return year_day -  92 if year_day < 122
            return year_day - 122 if year_day < 152
            return year_day - 152 if year_day < 182
            return year_day - 183 if year_day < 213
            return year_day - 213 if year_day < 243
            return year_day - 243 if year_day < 273
            return year_day - 274 if year_day < 304
            return year_day - 304 if year_day < 334
            return year_day - 334
          end

          def month_number(year_day)
            case year_day
              when 1..31
                1
              when 32..61
                2
              when 62..91
                3
              when 92..122
                4
              when 123..152
                5
              when 153..182
                6
              when 183..213
                7
              when 214..243
                8
              when 244..273
                9
              when 274..304
                10
              when 305..334
                11
              when 335..365
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
