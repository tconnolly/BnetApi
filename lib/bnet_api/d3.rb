require 'uri'

module BnetApi
  module D3
    extend self

    def career_profile(battletag)
      BnetApi.make_request("/d3/profile/#{URI.encode(battletag)}/")
    end

    def hero_profile(battletag, id)
      BnetApi.make_request("/d3/profile/#{URI.encode(battletag)}/hero/#{id}")
    end

    def item_data(data)
      BnetApi.make_request("/d3/data/item/#{data}")
    end

    def follower_data(follower)
      BnetApi.make_request("/d3/data/follower/#{follower}")
    end

    def artisan_data(artisan)
      BnetApi.make_request("/d3/data/artisan/#{artisan}")
    end
  end
end