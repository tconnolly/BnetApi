require 'json'
require 'openssl'
require 'open-uri'

require 'bnet_api/api'
require 'bnet_api/d3'
require 'bnet_api/sc2'
require 'bnet_api/wow'

module BnetApi
  extend self
  # API to use.
  # Set to "wow" for World of Warcraft API
  # Set to "d3" for Diablo 3 API
  # Set to "sc2" for Starcraft 2 API
  attr_accessor :api
  @@api = :wow
  
  # Application API key.
  attr_accessor :api_key
  @@api_key = nil
  
  # Locale to use.
  # Available locales:
  # Region: US
  #   en_US
  #   en_MX
  #   pt_BR
  # Region: EU
  #   en_GB
  #   es_ES
  #   fr_FR
  #   ru_RU
  #   de_DE
  #   pt_PT
  #   it_IT
  # Region: KR
  #   ko_KR
  # Region: TW
  #   zh_TW
  # Region: CN
  #   zh_CN
  attr_accessor :locale
  @@locale = :en_GB
  
  # OAuth token to use for OAuth profile APIs.
  @@oauth_token = nil
  
  # Region to use.
  # Available regions:
  #   US
  #   EU
  #   KR
  #   TW
  #   CN
  attr_accessor :region
  @@region = :eu
  
  def self.api
    @@api
  end
  
  def self.api=(api)
    @@api = api
  end
  
  def self.api_key
    @@api_key
  end
  
  def self.api_key=(api_key)
    @@api_key = api_key
  end
  
  def self.locale
    @@locale
  end
  
  def self.locale=(locale)
    @@locale = locale
  end
  
  def self.oauth_token
    @@oauth_token
  end
  
  def self.oauth_token=(oauth_token)
    @@oauth_token = oauth_token
  end
  
  def self.region
    @@region
  end
  
  def self.region=(region)
    @@region = region
  end
  
  def self.configure
    yield self
  end
end