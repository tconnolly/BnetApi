module BnetApi::WoW
  class Achievement
    attr_accessor :id,
                  :title,
                  :points,
                  :description,
                  :reward,
                  :rewardItems,
                  :icon,
                  :criteria,
                  :accountWide,
                  :factionId
    
    def initialize(id)
      @id = id
    end
    
    def get
      BnetApi.api = :wow
      json = BnetApi::Api.get("achievement/#{@id}")
      
      @id = json["id"]
      @title = json["title"]
      @points = json["points"]
      @description = json["description"]
      @reward = json["reward"]
      @rewardItems = json["rewardItems"]
      @icon = json["icon"]
      @criteria = json["criteria"]
      @accountWide = json["accountWide"]
      @factionId = json["factionId"]
      
      self
    end

  end
end