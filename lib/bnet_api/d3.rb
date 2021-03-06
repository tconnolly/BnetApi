require 'uri'

module BnetApi
  # All API methods relating to Diablo III are contained in this module.
  module D3
    extend self

    # Retrieves the career profile for the user with the specified battletag.
    #
    # @param battletag [String] The battletag of the user profile.
    # @return [Hash] A hash containing the career profile data.
    def career_profile(battletag)
      BnetApi.make_request("/d3/profile/#{URI.encode(battletag)}/")
    end

    # Retrieves the hero profile for the hero with the specified ID belonging
    # to the user with the specified battletag.
    #
    # @param battletag [String] The battletag of the user profile.
    # @param id [Integer] The ID of the hero.
    # @return [Hash] A hash containing the hero profile data.
    def hero_profile(battletag, id)
      BnetApi.make_request("/d3/profile/#{URI.encode(battletag)}/hero/#{id}")
    end

    # Retrieves the data for an item with the specified item data string.
    #
    # @param data [String] The item data string of the item.
    # @return [Hash] A hash containing the item data.
    def item_data(data)
      BnetApi.make_request("/d3/data/item/#{data}")
    end

    # Retrieves the data for the specified follower.
    #
    # @param follower [String] The name of the follower.
    # @return [Hash] A hash containing the follower data.
    def follower_data(follower)
      BnetApi.make_request("/d3/data/follower/#{follower}")
    end

    # Retrieves the data for the specified artisan.
    #
    # @param artisan [String] The name of the artisan.
    # @return [Hash] A hash containing the artisan data.
    def artisan_data(artisan)
      BnetApi.make_request("/d3/data/artisan/#{artisan}")
    end
  end
end