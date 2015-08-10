module Songkickr
  class CalendarEntry
    attr_accessor :reason, :event, :created_at

    CREATED_AT     = 'createdAt'.freeze
    EVENT          = 'event'.freeze
    REASON         = 'reason'.freeze
    TRACKED_ARTIST = 'trackedArtist'.freeze
    ATTENDANCE     = 'attendance'.freeze

    def initialize(calendar_entry_hash = {})
      @created_at = calendar_entry_hash[CREATED_AT]
      @event      = Event.new calendar_entry_hash[EVENT]
      @reason     = parse_reason(calendar_entry_hash[REASON])
    end

    protected

      def parse_reason(entry_reason = {})
        if entry_reason.include? TRACKED_ARTIST
          # trackedArtist is an array of artists
          entry_reason[TRACKED_ARTIST].map { |artist| Artist.new artist }
        elsif entry_reason.include? ATTENDANCE
          # attendance is a string i_might_go | im_going
          entry_reason[ATTENDANCE]
        end
      end
  end
end
