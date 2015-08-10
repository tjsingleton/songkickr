module Songkickr
  # A class to represent the result hash of a Tracking search.
  class TrackingResult
    attr_accessor :results

    RESULTS      = 'results'.freeze
    RESULTS_PAGE = 'resultsPage'.freeze
    TRACKING     = 'tracking'.freeze

    # Takes the result hash directly and parses out the page and total entries and finally passes off to the parse_results method to get the results.
    def initialize(result_hash = {})
      results_page = result_hash[RESULTS_PAGE]

      if results_page
        @results = parse_results results_page[RESULTS]
      end
    end

    protected

      # Take the results hash directly and parse the tracking into Tracking objects.
      #
      # Returns an array of Trackings.
      def parse_results(results = {})
        Songkickr::Tracking.new(results[TRACKING])
      end
  end
end
