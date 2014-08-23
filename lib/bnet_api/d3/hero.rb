module BnetApi::D3
  class Hero
    attr_accessor :id,
                  :class_name,
                  :dead,
                  :gender,
                  :hardcore,
                  :last_updated,
                  :level,
                  :name,
                  :paragon_level
                  
    def initialize(json)
      @id = json["id"]
      @class_name = json["class"]
      @dead = json["dead"]
      @gender = json["gender"] == 0 ? "Male" : "Female"
      @hardcore = json["hardcore"]
      @last_updated = Time.at(json["last-updated"])
      @level = json["level"]
      @name = json["name"]
      @paragon_level = json["paragonLevel"]
    end
    
    def load
      
    end
    
    def self.find_by_battle_tag_and_id(battle_tag, id)
      BnetApi.api = :d3
      return Hero.new(BnetApi::Api.get("profile/#{battle_tag}/hero/#{id}"))
    end
  end
end