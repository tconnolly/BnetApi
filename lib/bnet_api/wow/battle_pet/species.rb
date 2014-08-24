module BnetApi::WoW::BattlePet
  class Species
    attr_accessor :id,
                  :abilities,
                  :can_battle,
                  :creature_id,
                  :description,
                  :icon,
                  :name,
                  :pet_type_id,
                  :source
                  
    def initialize(id)
      @id = id
    end
    
    def get
      BnetApi.api = :wow
      
      json = BnetApi::Api.get("battlePet/species/#{id}")
      
      unless json == nil
        @abilities = Array.new
        json["abilities"].each do |ability|
          
        end
        
        @can_battle = json["canBattle"]
        @creature_id = json["creatureId"]
        @description = json["description"]
        @icon = json["icon"]
        @name = json["name"]
        @pet_type_id = json["petTypeId"]
        @source = json["source"]
      end
      
      self
    end
  end
end