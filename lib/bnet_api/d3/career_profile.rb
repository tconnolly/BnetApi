module BnetApi::D3
  class CareerProfile    
    attr_accessor :battle_tag,
                  :fallen_heroes,
                  :heroes,
                  :kills,
                  :last_hero_played,
                  :last_updated,
                  :paragon_level,
                  :paragon_level_hardcore,
                  :progression,
                  :time_played
                  
    def initialize(json)
      @battle_tag = json["battleTag"]
      @fallen_heroes = Array.new
      # Loop over fallen heroes array and add each one
      json["fallenHeroes"].each do |hero|
        @fallen_heroes.push Hero.new(hero)
      end
      # Loop over heroes array and add each one
      @heroes = Array.new
      json["heroes"].each do |hero|
        @heroes.push Hero.new(hero)
      end
      
      @kills = { 
        monsters: json["kills"]["monsters"], 
        elites: json["kills"]["elites"],
        hardcoreMonsters: json["kills"]["hardcoreMonsters"]
      }
      
      @last_hero_played = json["lastHeroPlayed"]
      @last_updated = Time.at(json["lastUpdated"])
      @paragon_level = json["paragonLevel"]
      @paragon_level_hardcore = json["paragonLevelHardcore"]            
    end
    
    def self.find_by_battle_tag(battle_tag)
      BnetApi.api = :d3
      return CareerProfile.new(BnetApi::Api.get("profile/#{battle_tag}/"))
    end
  end
end