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
    response = self.get("https://#{@config.region}.api.battle.net/#{request}#{build_url_params(optional_fields)}")
    if response["class"] != nil
      response["classId"] = response["class"]
      response.delete("class")
    end
    
    return response
  end

  def make_request_with_params(request, params)
    url = "https://#{@config.region}.api.battle.net/#{request}?"
    params.each do |k, v|
      url += "#{k}=#{v}&"
    end
    url += "locale=#{@config.locale}&apikey=#{@config.api_key}"

    response = self.get(url)
    if response["class"] != nil
      response["classId"] = response["class"]
      response.delete("class")
    end

    return response
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