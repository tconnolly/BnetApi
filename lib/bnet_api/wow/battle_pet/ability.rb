module BnetApi::WoW::BattlePet
  class Ability
    attr_accessor :id,
                  :cooldown,
                  :icon,
                  :hide_hints,
                  :is_passive,
                  :name,
                  :pet_type_id,
                  :rounds
                  
    def initialize(id)
      @id = id
    end
    
    def get
      BnetApi.api = :wow
      
      json = BnetApi::Api.get("battlePet/ability/#{@id}")
      
      unless json == nil
        @cooldown = json["cooldown"]
        @icon = json["icon"]
        @hide_hints = json["hideHints"]
        @is_passive = json["isPassive"]
        @name = json["name"]
        @pet_type_id = json["petTypeId"]
        @rounds = json["rounds"]
      end
      
      self
    end
  end
end