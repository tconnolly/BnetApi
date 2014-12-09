require 'uri'

module BnetApi
  module SC2
    extend self

    def profile(id, region, name)
      BnetApi.make_request("/sc2/profile/#{id}/#{region}/#{name}/")
    end

    def profile_ladders(id, region, name)
      BnetApi.make_request("/sc2/profile/#{id}/#{region}/#{name}/ladders")
    end

    def match_history(id, region, name)
      BnetApi.make_request("/sc2/profile/#{id}/#{region}/#{name}/matches")
    end

    def ladder(id)
      BnetApi.make_request("/sc2/ladder/#{id}")
    end

    def achievements_data
      BnetApi.make_request('/sc2/data/achievements')
    end

    def rewards_data
      BnetApi.make_request('/sc2/data/rewards')
    end
  end
end