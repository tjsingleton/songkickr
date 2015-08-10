module Songkickr
  # A class to represent the result hash of an Artist search.
  class ArtistResult < ResultSet
    TYPE = 'Artist'.freeze
    KEY  = 'artist'.freeze

    # Takes the result hash directly and parses out the page and total entries and finally passes off to the parse_results method to get the results.
    def initialize(result_hash = {})
      @result_type       = TYPE
      @result_key_string = KEY

      super
    end
  end
end
