module BnetApi
  # All API methods requiring OAuth authentication are contained in this module.
  module OAuth
    extend self

    # Retrieves the account ID number for the user with the specified access token.
    #
    # @param access_token [String] The user's OAuth access token.
    # @return [Hash] A hash containing the user's account ID.
    def account_id(access_token)
      BnetApi.make_request_oauth('/account/user/id', access_token)
    end

    # Retrieves the battletag for the user with the specified access token.
    #
    # @param access_token [String] The user's OAuth access token.
    # @return [Hash] A hash containing the user's battletag.
    def battletag(access_token)
      BnetApi.make_request_oauth('/account/user/battletag', access_token)
    end

    # Retrieves the Starcraft II profile for the user with the specified access token.
    #
    # @param access_token [String] The user's OAuth access token.
    # @return [Hash] A hash containing the user's Starcraft II profile data.
    def sc2_profile(access_token)
      BnetApi.make_request_oauth('/sc2/profile/user', access_token)
    end

    # Retrieves the World of Warcraft profile for the user with the specified access token.
    #
    # @param access_token [String] The user's OAuth access token.
    # @return [Hash] A hash containing the user's World of Warcraft profile data.
    def wow_profile(access_token)
      BnetApi.make_request_oauth('/wow/user/characters', access_token)
    end
  end
end