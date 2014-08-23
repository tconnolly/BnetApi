module BnetApi
  class Oauth2
    def initialize
      use OmniAuth::Builder do
        provider :bnet, Config::API_KEY, Config::API_SECRET
      end
    end
  end
end