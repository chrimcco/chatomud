require 'mixins/timers/calendar/definition'
require 'mixins/timers/calendar/utils'

module ChatoMud

  module Timers

    class Calendar

      include ChatoMud::Mixins::Timers::Calendar::Definition
      include ChatoMud::Mixins::Timers::Calendar::Utils

      def initialize(server)
        @server = server

        @data = nil

        @calendar_thread = nil 

        start_calendar_thread
      end

      def start_calendar_thread
        @calendar_thread = Thread.new(self, @server) do |calendar, server|
          while true do
            new_data = update

            echo = day_period_change_echo(@data, new_data) if @data

            @server.rooms_handler.broadcast_echo(echo, nil) if echo

            @data = new_data

            sleep(3)
          end
        end
      end

      def time_string
        #time    = time_from_data(@data)
        "It is #{day_period_name(@data)} (#{'%02d' % @data[:hour]}:#{'%02d' % @data[:hminute]}) on #{day_name(@data[:yday])} of the year #{@data[:year]} of the Steward's Reckoning."
      end

      private

      def update
        rl_time = Time.new

        rl_seconds = rl_time.yday * SECS_PER_RL_DAY + rl_time.hour * SECS_PER_RL_HOUR + rl_time.min * SECS_PER_RL_MINUTE + rl_time.sec
        ig_seconds = rl_seconds % SECS_PER_IG_YEAR

        ig_year  = IG_START_YEAR + (rl_time.year - RL_START_YEAR) * 4 + (rl_time.month) / 3 + 1
        ig_yday  = (ig_seconds / SECS_PER_IG_DAY) + 1
        ig_month = month_number(ig_yday)

        ig_hour   = (ig_seconds % SECS_PER_IG_DAY)  / SECS_PER_IG_HOUR
        ig_minute = (ig_seconds % SECS_PER_IG_HOUR) / SECS_PER_IG_MINUTE
        ig_second = ig_seconds  % SECS_PER_IG_MINUTE

        ig_day_minute = ig_hour * 60 + ig_minute

        {
          year:    ig_year,
          month:   ig_month,
          yday:    ig_yday,
          mday:    month_day(ig_yday),
          hour:    ig_hour,
          hminute: ig_minute,
          dminute: ig_day_minute,
          second:  ig_second
        }
      end

      def bye
        @calendar_thread.terminate
      end

    end

  end

end