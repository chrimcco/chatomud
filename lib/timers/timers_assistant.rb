require 'timers/calendar'

module ChatoMud

  module Timers

    class TimersAssistant

      attr_reader :calendar

      def initialize(server)
        @calendar = Calendar.new(server)
      end

      def bye
        @calendar.bye
      end

    end

  end

end