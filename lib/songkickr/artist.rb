module Songkickr
  # A single artist
  #
  #  {
  #   "uri":"http://www.songkick.com/artists/253846-radiohead",
  #   "displayName":"Radiohead",
  #   "id":253846,
  #   "onTourUntil":"2010-01-01"
  #  }
  #
  # http://www.songkick.com/developer/artist-search
  class Artist
    attr_accessor :uri, :display_name, :id, :on_tour_until, :identifier

    DISPLAY_NAME  = 'displayName'.freeze
    ID            = 'id'.freeze
    URI           = 'uri'.freeze
    ON_TOUR_UNTIL = 'onTourUntil'.freeze
    IDENTIFIER    = 'identifier'.freeze

    # Accepts a hash of artist attributes.
    def initialize(artist_hash = {})
      @display_name  = artist_hash[DISPLAY_NAME]
      @id            = artist_hash[ID]
      @uri           = artist_hash[URI]
      @on_tour_until = artist_hash[ON_TOUR_UNTIL]
      @identifier    = artist_hash[IDENTIFIER]
    end
  end
end
