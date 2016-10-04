require 'uri'

module BnetApi
  # All API methods relating to World of Warcraft are contained in this module.
  module WoW
    extend self

    # Retrieves the achievement with the specified ID.
    #
    # @param id [Integer] The ID of the achievement.
    # @return [Hash] A hash containing the achievement data.
    def achievement(id)
      BnetApi.make_request("/wow/achievement/#{id}")
    end

    # Retrieves the URL of a JSON file containing the most recent auction data dump.
    #
    # @param realm [String] The realm to retrieve auction data for.
    # @return [Hash] A hash containing the URL of the auction data file.
    def auction_data(realm)
      BnetApi.make_request("/wow/auction/data/#{realm}")
    end

    # Retrieves the challenge mode leaderboard for the specified realm.
    #
    # @param realm [String] The realm to retrieve the leaderboard for.
    # @return [Hash] A hash containing the leaderboard data.
    def challenge_mode_realm(realm)
      BnetApi.make_request("/wow/challenge/#{realm}")
    end

    # Retrieves the challenge mode leaderboard for the current API region.
    #
    # @return [Hash] A hash containing the leaderboard data.
    def challenge_mode_region
      BnetApi.make_request('/wow/challenge/region')
    end

    # Retrieves the character with the specified name on the specified realm.
    #
    # @param realm [String] The realm the character is on.
    # @param name [String] The name of the character.
    # @param *optional_fields [Array<Symbol>] Any optional fields to retrieve data for.
    # @return [Hash] A hash containing the character data.
    def character(realm, name, *optional_fields)
      if optional_fields[0] == :all
        optional_fields = :achievements, :appearance, :feed, :guild, :items, :mounts, :pets, :petSlots, :progression, :pvp, :quests, :reputation, :stats, :talents, :titles, :audit
      end
      BnetApi.make_request("/wow/character/#{URI.escape(realm)}/#{URI.escape(name)}", optional_fields)
    end

    # Retrieves the item with the specified ID.
    #
    # @param id [Integer] The ID of the item.
    # @return [Hash] A hash containing the item data.
    def item(id)
      BnetApi.make_request("/wow/item/#{id}")
    end

    # Retrieves the item set with the specified ID.
    #
    # @param id [Integer] The ID of the item set.
    # @return [Hash] A hash containing the item set data.
    def item_set(id)
      BnetApi.make_request("/wow/item/set/#{id}")
    end

    # Retrieves the guild with the specified name on the specified realm.
    #
    # @param realm [String] The realm the guild is on.
    # @param name [String] The name of the guild.
    # @param *optional_fields[Array<Symbol>] Any optional fields to retrieve data for.
    # @return [Hash] A hash containing the guild data.
    def guild(realm, name, *optional_fields)
      if optional_fields[0] == :all
        optional_fields = :members, :achievements, :news, :challenge
      end
      BnetApi.make_request("/wow/guild/#{URI.escape(realm)}/#{URI.escape(name)}", optional_fields)
    end
    
    def pet_master_list()
      BnetApi.make_request("/wow/pet/")
    end
    
    # Retrieves the battlepet ability with the specified ID.
    #
    # @param id [Integer] The ID of the ability.
    # @return [Hash] A hash containing the ability data.
    def pet_ability(id)
      BnetApi.make_request("/wow/pet/ability/#{id}")
    end

    # Retrieves the battlepet species with the specified ID.
    #
    # @param id [Integer] The ID of the species.
    # @return [Hash] A hash containing the species data.
    def pet_species(id)
      BnetApi.make_request("/wow/pet/species/#{id}")
    end

    # Retrieves the stats for the battlepet with the specified ID.
    #
    # @param species_id [Integer] The ID of the battlepet species.
    # @param options [Hash] Any additional options.
    # @option options [Integer] :level The level of the species.
    # @option options [Integer] :breedId The ID of the breed.
    # @option options [Integer] :qualityId The quality of the battlepet.
    # @return [Hash] A hash containing the battlepet stats data.
    def pet_stats(species_id, options = {})
      level = options[:level] || 1
      breedId = options[:breedId] || 3
      qualityId = options[:qualityId] || 1

      BnetApi.make_request_with_params("/wow/pet/stats/#{species_id}",
        { 
          level: level, 
          breedId: breedId, 
          qualityId: qualityId }
      )
    end

    # Retrieves the PvP leaderboard for the specified bracket.
    #
    # @param bracket [String] The PvP bracket to retrieve data for.
    # @return [Hash] A hash containing the leaderboard data.
    def pvp(bracket)
      BnetApi.make_request("/wow/leaderboard/#{bracket}")
    end

    # Retrieves the quest with the specified ID.
    #
    # @param id [Integer] The ID of the quest.
    # @return [Hash] A hash containing the quest data.
    def quest(id)
      BnetApi.make_request("/wow/quest/#{id}")
    end

    # Retrieves the realm status for the region. If any realms are specified as parameters,
    # only the status of these realms will be returned.
    #
    # @param *realms [Array<String>] Any realms to restrict the data to.
    # @return [Hash] A hash containing the realm status data.
    def realm_status(*realms)
      if realms.count > 0
        BnetApi.make_request_with_params("/wow/realm/status", { realms: realms.join(',') })
      else
        BnetApi.make_request("/wow/realm/status")
      end
    end

    # Retrieves the recipe with the specified ID.
    #
    # @param id [Integer] The ID of the recipe.
    # @return [Hash] A hash containing the recipe data.
    def recipe(id)
      BnetApi.make_request("/wow/recipe/#{id}")
    end

    # Retrieves the spell with the specified ID.
    #
    # @param id [Integer] The ID of the spell.
    # @return [Hash] A hash containing the spell data.
    def spell(id)
      BnetApi.make_request("/wow/spell/#{id}")
    end
  end
end