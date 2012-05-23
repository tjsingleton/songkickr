require 'songkickr/version'
require 'songkickr/performance'
require 'songkickr/artist'
require 'songkickr/location'
require 'songkickr/location_result'
require 'songkickr/venue'
require 'songkickr/event'
require 'songkickr/setlist_item'
require 'songkickr/setlist'
require 'songkickr/event_result'
require 'songkickr/concert_setlist_result'
require 'songkickr/remote'
require 'songkickr/artist_result'

class APIKeyNotSet < StandardError
  # Warns of missing API key
  def to_s
    'API key not set!'
  end
end

class ResouceNotFound < StandardError
  def to_s
    "Resource not found"
  end
end

module Songkickr
  # Returns the Songkick API key
  # In order to use the Songkick API, you must have a Songkick API (their rule, not mine).
  # Get an API key for your app from http://developer.songkick.com/
  #
  # ==== Example
  #
  #   require 'songkickr'
  #   remote = Songkickr::Remote.new XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  #   remote.api_key
  #   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  def self.api_key
    raise APIKeyNotSet if @api_key.nil?

    @api_key
  end

  # Set the API key. In the event you need to set the API key after initializing the the remote.
  # === Parameters
  #
  # * +api_key+ - A developer key from Songkick. Get an API key for your app from http://developer.songkick.com/
  def self.api_key=(api_key)
    @api_key = api_key
  end

  def def symbolize_keys
    inject({}) do |options, (key, value)|
      options[(key.to_sym rescue key) || key] = value
      options
    end
  end
end
