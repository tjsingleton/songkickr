module Songkickr
  module RemoteApi
    module ArtistDetails
      RESULTS_PAGE = 'resultsPage'.freeze
      RESULTS      = 'results'.freeze
      ARTIST       = 'artist'.freeze

      # === Artist API
      # Undocumented, but it works fine
      #
      # Getting detailed information of a single artist.
      #
      # === Parameters
      #  * +artist_id+ - Songkick artist_id, use artist_search to get it
      def artist(artist_id)
        result = get("/artists/#{artist_id}.json")
        Songkickr::Artist.new result[RESULTS_PAGE][RESULTS][ARTIST]
      end
    end
  end
end
