module Songkickr
  # A class to represent the hash of a Location.
  #
  #   {
  #     "city":{
  #       "displayName":"London",
  #       "country":{
  #         "displayName":"UK"},
  #         "lng":-0.128,
  #         "lat":51.5078
  #       },
  #       "metroArea":{
  #         "uri":"http://www.songkick.com/metro_areas/24426-uk-london",
  #         "displayName":"London",
  #         "country":{  "displayName":"UK" },
  #         "id":24426,
  #         "lng":-0.128,
  #         "lat":51.5078
  #       }
  #     }
  #   }
  #
  # http://www.songkick.com/developer/location-search
  class Location
    attr_accessor :city, :lat, :lng, :metro_area

    CITY         = 'city'.freeze
    LAT          = 'lat'.freeze
    LNG          = 'lng'.freeze
    DISPLAY_NAME = 'displayName'.freeze
    METRO_AREA   = 'metroArea'.freeze

    # Takes a location hash. Handles the different city hashes from Event and Location
    def initialize(location_hash)
      if location_hash[CITY].is_a?(String) # location in Event
        @city = location_hash[CITY]
        @lat  = location_hash[LAT]
        @lng  = location_hash[LNG]
      elsif location_hash[CITY].is_a?(Hash) # stand-alone Location
        city_hash = location_hash[CITY]
        @city = city_hash[DISPLAY_NAME] if city_hash && city_hash[DISPLAY_NAME]
        # some locations have a null lng, lat in city hash, but have non-null in metroArea hash
        @lat  = city_hash[LAT]
        @lng  = city_hash[LNG]
      end

      @metro_area = MetroArea.new location_hash[METRO_AREA] if location_hash.include? METRO_AREA
    end
  end
end
