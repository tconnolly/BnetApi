module BnetApi
  module OAuth
    extend self

    def account_id(access_token)
      BnetApi.make_request_oauth('/account/user/id', access_token)
    end

    def battletag(access_token)
      BnetApi.make_request_oauth('/account/user/battletag', access_token)
    end

    def sc2_profile(access_token)
      BnetApi.make_request_oauth('/sc2/profile/user', access_token)
    end

    def wow_profile(access_token)
      BnetApi.make_request_oauth('/wow/user/characters', access_token)
    end
  end
end