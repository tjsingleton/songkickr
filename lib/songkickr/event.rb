module Songkickr
  # A single event
  #
  #   {
  #     "displayName": "Vampire Weekend at O2 Academy Brixton (February 16, 2010)",
  #     "type": "Concert",
  #     "uri": "http://www.songkick.com/concerts/3037536-vampire-weekend-at-o2-academy-brixton?utm_medium=partner&utm_source=131",
  #     "venue": {
  #       "lng": -0.1187418,
  #       "displayName": "O2 Academy Brixton",
  #       "lat": 51.4681089,
  #       "id": 17522
  #     },
  #     "location": {
  #       "lng": -0.1187418,
  #       "city": "London, UK",
  #       "lat": 51.4681089
  #     },
  #     "start": {
  #       "time": "19:30:00",
  #       "date": "2010-02-16"
  #     },
  #     "performance": [{
  #       "artist": {
  #         "uri": "http://www.songkick.com/artists/288696-vampire-weekend",
  #         "displayName": "Vampire Weekend",
  #         "id": 288696,
  #         "identifier": [{"mbid": "af37c51c-0790-4a29-b995-456f98a6b8c9"}]
  #       }
  #       "displayName": "Vampire Weekend",
  #       "billingIndex": 1,
  #       "id": 5380281,
  #       "billing": "headline"
  #     }],
  #     "id": 3037536
  #   }
  #
  # http://www.songkick.com/developer/artist-search
  class Event
    attr_accessor :popularity, :type, :display_name, :location, :start, :uri, :id, :performances, :status, :venue, :tickets_uri, :series, :start_time, :start_date, :start_datetime

    POPULARITY   = 'popularity'.freeze
    TYPE         = 'type'.freeze
    LOCATION     = 'location'.freeze
    STATUS       = 'status'.freeze
    DISPLAY_NAME = 'displayName'.freeze
    VENUE        = 'venue'.freeze
    START        = 'start'.freeze
    URI          = 'uri'.freeze
    PERFORMANCE  = 'performance'.freeze
    ID           = 'id'.freeze
    TICKETS_URI  = 'ticketsUri'.freeze
    SERIES       = 'series'.freeze
    DATE         = 'date'.freeze
    TIME         = 'time'.freeze
    DATETIME     = 'datetime'.freeze

    def initialize(event_hash)
      @popularity   = event_hash[POPULARITY].to_f
      @type         = event_hash[TYPE]
      @location     = Songkickr::Location.new event_hash[LOCATION]
      @status       = event_hash[STATUS]
      @display_name = event_hash[DISPLAY_NAME]
      @venue        = Songkickr::Venue.new event_hash[VENUE]
      @start        = start_hash_to_datetime event_hash[START]
      @uri          = event_hash[URI]
      @performances = parse_performance event_hash[PERFORMANCE]
      @id           = event_hash[ID]
      @tickets_uri  = event_hash[TICKETS_URI]
      @series       = event_hash[SERIES][DISPLAY_NAME] if event_hash[SERIES] && event_hash[SERIES][DISPLAY_NAME]

      if event_hash[START]
        @start_datetime = event_hash[START][DATETIME]
        @start_time     = event_hash[START][TIME]
        @start_date     = event_hash[START][DATE]
      end
    end

    protected

      # Takes the start hash and turns in into a DateTime object.
      def start_hash_to_datetime(start_hash)
        DateTime.parse "#{start_hash[DATE]} #{start_hash[TIME]}"
      end

      # Builds a list of Performance objects.
      def parse_performance(performances = [])
        performances.map { |performance| Songkickr::Performance.new performance }
      end
  end
end
