require 'bnet_api/d3'
require 'bnet_api/oauth'
require 'bnet_api/wow'
require 'bnet_api/wow_data'
require 'bnet_api/version'

require 'httparty'
require 'ostruct'

module BnetApi
  extend self
  include HTTParty

  def configure
    yield config
  end

  def config
    @config ||= OpenStruct.new(region: :eu, locale: :en_GB)
  end

  def make_request(request, *optional_fields)
    self.get("https://#{@config.region}.api.battle.net/#{request}#{build_url_params(optional_fields)}")
  end

  def make_request_with_params(request, params)
    url = "https://#{@config.region}.api.battle.net/#{request}?"
    params.each do |k, v|
      url += "#{k}=#{v}&"
    end
    url += "locale=#{@config.locale}&apikey=#{@config.api_key}"

    self.get(url)
  end

  def make_request_oauth(request, access_token)
    self.get("https://#{@config.region}.api.battle.net/#{request}?locale=#{@config.locale}&access_token=#{access_token}")
  end

  private
    def build_url_params(*optional_fields)
      url_params = "?locale=#{@config.locale}&apikey=#{@config.api_key}"
      if optional_fields != nil
        url_params += "&fields=#{optional_fields.join(',')}"
      end
      return url_params
    end
end