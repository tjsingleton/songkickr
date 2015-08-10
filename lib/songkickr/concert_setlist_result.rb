module Songkickr
  # A class to represent the result hash of an Setlist search.
  #
  # http://www.songkick.com/developer/setlists
  class ConcertSetlistResult < ResultSet
    TYPE = 'Setlist'.freeze
    KEY  = 'setlist'.freeze

    # Takes the result ash and passes it to parse_results
    def initialize(result_hash = {})
      @result_type       = TYPE
      @result_key_string = KEY

      super
    end
  end
end
