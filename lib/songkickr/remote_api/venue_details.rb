module Songkickr
  module RemoteApi
    module VenueDetails
      RESULTS_PAGE = 'resultsPage'.freeze
      RESULTS      = 'results'.freeze
      VENUE        = 'venue'.freeze

      # ==== Venue Details
      # http://www.songkick.com/developer/venue-details
      #
      # === Parameters
      #
      # * +venue_id+ - Songkick venue ID.
      def venue(venue_id)
        result = get("/venues/#{venue_id}.json")
        Songkickr::Venue.new result[RESULTS_PAGE][RESULTS][VENUE]
      end
    end
  end
end
