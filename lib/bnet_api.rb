require 'bnet_api/d3'
require 'bnet_api/oauth'
require 'bnet_api/sc2'
require 'bnet_api/wow'
require 'bnet_api/wow_data'
require 'bnet_api/version'

require 'httparty'
require 'ostruct'

# The base module namespace for the BnetApi library.
module BnetApi
  extend self
  include HTTParty

  # Yields the API configuration object.
  def configure
    yield config
  end

  # Sets up the configuration of the API.
  def config
    @config ||= OpenStruct.new(region: :eu, locale: :en_GB)
  end

  # Sends a HTTPS GET request to the Battle.net API and returns the retrieved data in a hash.
  #
  # @param request [String] The API endpoint to request.
  # @param *optional_fields[Array<Symbol>] Any optional fields to be requested from the API.
  # @return [Hash] A hash of the data returned from the API.
  def make_request(request, *optional_fields)
    self.get("https://#{@config.region}.api.battle.net/#{request}#{build_url_params(optional_fields)}")
  end

  # Sends a HTTPS GET request to the Battle.net API with some additional URL parameters
  # and returns the retrieved data in a hash.
  #
  # @param request [String] The API endpoint to request.
  # @param params [Hash] A hash containing key/value pairs of URL parameters.
  # @return [Hash] A hash of the data returned from the API.
  def make_request_with_params(request, params)
    url = "https://#{@config.region}.api.battle.net/#{request}?"
    params.each do |k, v|
      url += "#{k}=#{v}&"
    end
    url += "locale=#{@config.locale}&apikey=#{@config.api_key}"

    self.get(url)
  end

  # Sends a HTTPS GET request to the Battle.net API using OAuth instead of API key authentication
  # and returns the retrieved data in a hash.
  #
  # @param request [String] The API endpoint to request.
  # @param access_token [String] The user's OAuth access token.
  # @return [Hash] A hash of the data returned from the API.
  def make_request_oauth(request, access_token)
    self.get("https://#{@config.region}.api.battle.net/#{request}?locale=#{@config.locale}&access_token=#{access_token}")
  end

  private
    # Builds the URL parameters for the make_request method.
    #
    # @params *optional_fields [Array<Symbol>] Any optional fields to put in the URL.
    # @return [String] The URL parameters for the request.
    def build_url_params(*optional_fields)
      url_params = "?locale=#{@config.locale}&apikey=#{@config.api_key}"
      if optional_fields != nil
        url_params += "&fields=#{optional_fields.join(',')}"
      end
      return url_params
    end
end