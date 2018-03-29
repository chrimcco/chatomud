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
        ig_time    = @data[:ig_time]
        year       = @data[:year]
        day_minute = @data[:day_minute]

        "It is #{day_period_name(ig_time, day_minute)} (#{ig_time.hour}:#{ig_time.min}) on #{day_name(ig_time.yday - 1)} of the year #{year} of the Steward's Reckoning."
      end

      private

      def update
        rl_time = Time.new

        ig_seconds = ((rl_time.yday * RL_SEC_PER_DAY + rl_time.hour * RL_SEC_PER_HOUR + rl_time.min * RL_SEC_PER_MINUTE + rl_time.sec) % IG_SEC_PER_YEAR) * 4

        year   = IG_START_YEAR + rl_time.year - RL_START_YEAR + (rl_time.month - 1) / 3
        year_day = ig_seconds / RL_SEC_PER_DAY
        month  = month_number(year_day)
        hour   = (ig_seconds % (year_day * RL_SEC_PER_DAY)) / RL_SEC_PER_HOUR
        minute = (ig_seconds % (year_day * RL_SEC_PER_DAY + hour * RL_SEC_PER_HOUR)) / RL_SEC_PER_MINUTE
        second = ig_seconds % 60

        day_minute = hour * RL_MIN_PER_HOUR + minute

        ig_time = DateTime.new(rl_time.year, month, month_day(year_day), hour, minute, second)

        {
          year: year,
          ig_time: ig_time,
          day_minute: day_minute
        }
      end

      def bye
        @calendar_thread.terminate
      end

    end

  end

end