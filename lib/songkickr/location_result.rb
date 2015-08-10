module Songkickr
  # A class to represent the result hash of a Location search.
  class LocationResult < ResultSet
    TYPE = 'Location'.freeze
    KEY  = 'location'.freeze

    def initialize(result_hash = {})
      @result_type       = TYPE
      @result_key_string = KEY

      super
    end
  end
end
