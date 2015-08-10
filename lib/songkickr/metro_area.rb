module Songkickr
  # metroArea: {
  #   displayName: "Twin Cities",
  #   uri: "http://www.songkick.com/metro_areas/35130-us-twin-cities?utm_source=4791&utm_medium=partner",
  #   id: 35130,
  #   state: {
  #     displayName: "MN"
  #   },
  #   country: {
  #     displayName: "US"
  #   },
  #   lat: 44.9801,
  #   lng: -93.2519
  # }
  class MetroArea
    attr_accessor :display_name, :uri, :id, :state, :country, :lat, :lng

    DISPLAY_NAME = 'displayName'.freeze
    ID           = 'id'.freeze
    URI          = 'uri'.freeze
    STATE        = 'state'.freeze
    COUNTRY      = 'country'.freeze
    LAT          = 'lat'.freeze
    LNG          = 'lng'.freeze

    def initialize(metro_area_hash)
      @display_name = metro_area_hash[DISPLAY_NAME]
      @id           = metro_area_hash[ID]
      @uri          = metro_area_hash[URI]
      @state        = metro_area_hash[STATE][DISPLAY_NAME] if metro_area_hash.include?(STATE) && metro_area_hash[STATE].include?(DISPLAY_NAME)
      @country      = metro_area_hash[COUNTRY][DISPLAY_NAME] if metro_area_hash.include?(COUNTRY) && metro_area_hash[COUNTRY].include?(DISPLAY_NAME)
      @lat          = metro_area_hash[LAT] if metro_area_hash.include? LAT
      @lng          = metro_area_hash[LNG] if metro_area_hash.include? LNG
    end
  end
end
