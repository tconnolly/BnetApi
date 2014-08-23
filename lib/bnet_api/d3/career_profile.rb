module BnetApi::D3
  class CareerProfile
    attr_accessor :heroes,
                  :last_hero_played,
                  :last_updated,
                  :kills,
                  :time_played,
                  :fallen_heroes,
                  :paragon_level,
                  :paragon_level_hardcore,
                  :battle_tag,
                  :progression
                  
    def initialize(json)
      
    end
    
    def self.find_by_battle_tag(battle_tag)
      BnetApi.api = :d3
      return CareerProfile.new(Bnet::Api.get("profile/#{battle_tag}"))
    end
  end
end