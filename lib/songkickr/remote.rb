Dir[File.dirname(__FILE__) + '/remote_api/*.rb'].each { |file| require file }

module Songkickr
  # Create an instance of the remote class to interact with the Songkick API.
  class Remote
    include HTTParty
    include Songkickr::RemoteApi::UpcomingEvents
    include Songkickr::RemoteApi::UserEventsAndTrackings
    include Songkickr::RemoteApi::PastEvents
    include Songkickr::RemoteApi::ArtistDetails
    include Songkickr::RemoteApi::EventDetails
    include Songkickr::RemoteApi::VenueDetails
    include Songkickr::RemoteApi::SimilarArtists

    attr_accessor :debug
    attr_reader :api_key

    base_uri 'api.songkick.com/api/3.0'
    format :json

    class GzippedJsonParser < HTTParty::Parser
      SupportedFormats.merge!({'application/x-gzip'.freeze => :gzip})

      def gzip
        gz = Zlib::GzipReader.new(StringIO.new(body))
        JSON.parse(gz.read)
      ensure
        gz.close if gz
      end
    end

    parser(GzippedJsonParser)

    # ==== Create a new instance of the remote class to talk to Songkick
    # Get an API key for your app from http://developer.songkick.com/
    def initialize(api_key = nil, options = {})
      @api_key = api_key
      @api_key ||= Songkickr.api_key
      @debug = options[:debug] || false

      self.class.default_params :apikey => @api_key
      if @debug
        self.class.debug_output $stderr
      end
    end

    RESULTS_PAGE = 'resultsPage'.freeze
    ERROR        = 'error'.freeze
    MESSAGE      = 'message'.freeze

    NOT_FOUND_REGEX = /not found/

    def get(location, query_params = {})
      result = self.class.get(location, query_params)
      # FIXME: this is shit. should be based on on http response.
      if result[RESULTS_PAGE][ERROR]
        msg = result[RESULTS_PAGE][ERROR][MESSAGE]
        raise ResourceNotFound if msg =~ NOT_FOUND_REGEX
        raise APIError.new(msg)
      end
      result
    end
  end
end
