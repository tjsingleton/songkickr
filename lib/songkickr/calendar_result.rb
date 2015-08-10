module Songkickr
  class CalendarResult < ResultSet
    TYPE = 'CalendarEntry'.freeze
    KEY  = 'calendarEntry'.freeze

    def initialize(result_hash = {})
      @result_type       = TYPE
      @result_key_string = KEY

      super
    end
  end
end
