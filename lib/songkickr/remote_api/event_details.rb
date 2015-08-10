module Songkickr
  module RemoteApi
    module EventDetails
      RESULTS_PAGE = 'resultsPage'.freeze
      RESULTS      = 'results'.freeze
      EVENT        = 'event'.freeze

      # ==== Event API
      # http://www.songkick.com/developer/upcoming-events
      #
      # Getting detailed information of a single event.
      #
      # === Parameters
      # * +event_id+ - Songkick event ID. Extract the event ID either from a previous API call or from the URL of the event page on the website.
      def event(event_id)
        result = get("/events/#{event_id}.json")
        Songkickr::Event.new result[RESULTS_PAGE][RESULTS][EVENT]
      end
    end
  end
end
