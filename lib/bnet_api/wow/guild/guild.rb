module BnetApi
  class Guild
    attr_accessor :achievementPoints,
                  :battlegroup,
                  :level,
                  :name,
                  :realm,
                  :side,
                  # Optional fields
                  :achievements,
                  :challenge,
                  :members,
                  :news
    
    SIDES = {
      0 => "Alliance",
      1 => "Horde"
    }
    
    def initialize(json)
      @achievementPoints = json["achievementPoints"]
      @battlegroup = json["battlegroup"]
      @level = json["level"]
      @members = Array.new
      @name = json["name"]
      @realm = json["realm"]
      @side = SIDES[json["side"]]
      # Optional fields
      @achievements = json["achievements"]
      @challenge = json["challenge"]
      @news = GuildNews.new(json["news"])
      
      members = json["members"]
      
      if members != nil
        members.each do |member|
          character = Character.new(member["character"])
          character.rank = member["rank"]
          # Check character has a spec
          if member["character"]["spec"] != nil
            character.spec = Spec.new(member["character"]["spec"])
          end
          @members.push(character)
        end
      end
    end
    
    def self.find_by_realm_and_name(realm, name, *options)
      # Request all optional fields
      if options.include? :all
        fields = { :fields => "achievements,challenge,members,news" }
      else
        fields = { :fields => options.join(",") } unless options.empty?
      end
      
      return Guild.new(ApiConnection.get("guild/#{realm}/#{name}", fields))
    end
  end
end