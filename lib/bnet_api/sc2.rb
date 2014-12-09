require 'uri'

module BnetApi
  # All API methods relating to Starcraft II are contained in this module.
  module SC2
    extend self

    # Retrieves the profile for specified user.
    #
    # @param id [Integer] The user's profile ID.
    # @param region [Integer] The region the user is in.
    # @param name [String] The name of the user's profile.
    # @return [Hash] A hash containing the profile data.
    def profile(id, region, name)
      BnetApi.make_request("/sc2/profile/#{id}/#{region}/#{name}/")
    end

    # Retrieves the ladders a profile is in.
    #
    # @param id [Integer] The user's profile ID.
    # @param region [Integer] The region the user is in.
    # @param name [String] The name of the user's profile.
    # @return [Hash] A hash containing the profile's ladder data.
    def profile_ladders(id, region, name)
      BnetApi.make_request("/sc2/profile/#{id}/#{region}/#{name}/ladders")
    end

    # Retrieves the match history for the specified profile.
    #
    # @param id [Integer] The user's profile ID.
    # @param region [Integer] The region the user is in.
    # @param name [String] The name of the user's profile.
    # @return [Hash] A hash containing the profile's match history data.
    def match_history(id, region, name)
      BnetApi.make_request("/sc2/profile/#{id}/#{region}/#{name}/matches")
    end

    # Retrieves the ladder data for the ladder with the specified ID.
    #
    # @param id [String] The ID of the ladder.
    # @return [Hash] A hash containing the ladder data.
    def ladder(id)
      BnetApi.make_request("/sc2/ladder/#{id}")
    end

    # Retrieves all achievements data.
    # @return [Hash] A hash containing the achievements data.
    def achievements_data
      BnetApi.make_request('/sc2/data/achievements')
    end

    # Retrieves all rewards data.
    # @return [Hash] A hash containing the rewards data.
    def rewards_data
      BnetApi.make_request('/sc2/data/rewards')
    end
  end
end