module Songkickr
  class Venue
    attr_accessor :capacity, :display_name, :description, :id, :lat, :lng, :metro_area, :phone, :street, :uri, :website, :zip

    CAPACITY     = 'capacity'.freeze
    DISPLAY_NAME = 'displayName'.freeze
    DESCRIPTION  = 'description'.freeze
    ID           = 'id'.freeze
    LAT          = 'lat'.freeze
    LNG          = 'lng'.freeze
    METRO_AREA   = 'metroArea'.freeze
    PHONE        = 'phone'.freeze
    STREET       = 'street'.freeze
    URI          = 'uri'.freeze
    WEBSITE      = 'website'.freeze
    ZIP          = 'zip'.freeze

    def initialize(venue_hash)
      @capacity     = venue_hash[CAPACITY]
      @display_name = venue_hash[DISPLAY_NAME]
      @description  = venue_hash[DESCRIPTION]
      @id           = venue_hash[ID]
      @lat          = venue_hash[LAT]
      @lng          = venue_hash[LNG]
      @metro_area   = Songkickr::MetroArea.new venue_hash[METRO_AREA] if venue_hash.include?(METRO_AREA)
      @phone        = venue_hash[PHONE]
      @street       = venue_hash[STREET]
      @uri          = venue_hash[URI]
      @website      = venue_hash[WEBSITE]
      @zip          = venue_hash[ZIP]
    end
  end
end
