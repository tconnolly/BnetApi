require 'uri'

module BnetApi
  module WoW
    extend self

    def achievement(id)
      BnetApi.make_request("/wow/achievement/#{id}")
    end

    def auction_data(realm)
      BnetApi.make_request("/wow/auction/data/#{realm}")
    end

    def battlepet_ability(id)
      BnetApi.make_request("/wow/battlePet/ability/#{id}")
    end

    def battlepet_species(id)
      BnetApi.make_request("/wow/battlePet/species/#{id}")
    end

    def battlepet_stats(species_id, options = {})
      level = options[:level] || 1
      breedId = options[:breedId] || 3
      qualityId = options[:qualityId] || 1

      BnetApi.make_request_with_params("/wow/battlePet/stats/#{species_id}",
        { 
          level: level, 
          breedId: breedId, 
          qualityId: qualityId }
      )
    end

    def challenge_mode_realm(realm)
      BnetApi.make_request("/wow/challenge/#{realm}")
    end

    def challenge_mode_region
      BnetApi.make_request('/wow/challenge/region')
    end

    def character(realm, name, *optional_fields)
      if optional_fields[0] == :all
        optional_fields = :achievements, :appearance, :feed, :guild, :items, :mounts, :pets, :petSlots, :progression, :pvp, :quests, :reputation, :stats, :talents, :titles, :audit
      end
      BnetApi.make_request("/wow/character/#{URI.escape(realm)}/#{URI.escape(name)}", optional_fields)
    end

    def item(id)
      BnetApi.make_request("/wow/item/#{id}")
    end

    def item_set(id)
      BnetApi.make_request("/wow/item/set/#{id}")
    end

    def guild(realm, name, *optional_fields)
      if optional_fields[0] == :all
        optional_fields = :members, :achievements, :news, :challenge
      end
      BnetApi.make_request("/wow/guild/#{URI.escape(realm)}/#{URI.escape(name)}", optional_fields)
    end

    def pvp(bracket)
      BnetApi.make_request("/wow/leaderboard/#{bracket}")
    end

    def quest(id)
      BnetApi.make_request("/wow/quest/#{id}")
    end

    def realm_status(*realms)
      if realms != nil
        BnetApi.make_request_with_params("/wow/realm/status", { realms: realms.join(',') })
      else
        BnetApi.make_request("/wow/realm/status")
      end
    end

    def recipe(id)
      BnetApi.make_request("/wow/recipe/#{id}")
    end

    def spell(id)
      BnetApi.make_request("/wow/spell/#{id}")
    end
  end
end