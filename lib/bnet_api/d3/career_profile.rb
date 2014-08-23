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
    
    def initialize(battle_tag = nil)
      @battle_tag = battle_tag
    end
    
    def get
      BnetApi.api = :d3
      json = BnetApi::Api.get("profile/#{battle_tag}/")
      
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
      
      @progression = {
        act1: json["progression"]["act1"],
        act2: json["progression"]["act2"],
        act3: json["progression"]["act3"],
        act4: json["progression"]["act4"],
        act5: json["progression"]["act5"]
      }
      
      self
    end
    
    def self.find_by_battle_tag(battle_tag)
      return CareerProfile.new(battle_tag).get
    end
  end
end