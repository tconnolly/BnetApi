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
    
    def initialize(json)
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
    end
    
    def self.find_by_id(id)
      BnetApi.api = :wow
      return Achievement.new(BnetApi::Api.get("achievement/#{id}"))
    end
  end
end