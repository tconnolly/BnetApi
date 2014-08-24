module BnetApi::WoW::BattlePet
  class Stats
    attr_accessor :breed_id,
                  :health,
                  :level,
                  :pet_quality_id,
                  :power,
                  :species_id,
                  :speed
                  
    def initialize(species_id, level, breed_id, pet_quality_id)
      @species_id = species_id
      @level = level
      @breed_id = breed_id
      @pet_quality_id = pet_quality_id
    end
    
    def get
      BnetApi.api = :wow
      
      json = BnetApi::Api.get("battlePet/stats/#{@species_id}?level=#{level}&breedId=#{@breed_id}&qualityId=#{@pet_quality_id}")
      
      unless json == nil
        @health = json["health"]
        @power = json["power"]
        @speed = json["speed"]
      end
      
      self
    end
  end
end