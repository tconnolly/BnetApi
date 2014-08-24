module BnetApi::WoW
  class Guild
    attr_accessor :achievement_points,
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
    
    def initialize(realm, name)
      @realm = realm
      @name = name
    end
    
    def get(*options)
      BnetApi.api = :wow
      
      # Request all optional fields
      if options.include? :all
        fields = { :fields => "achievements,challenge,members,news" }
      else
        fields = { :fields => options.join(",") } unless options.empty?
      end
      
      json = BnetApi::Api.get("guild/#{realm}/#{name}", nil, fields)
      
      @achievement_points = json["achievementPoints"]
      @battlegroup = json["battlegroup"]
      @level = json["level"]
      @members = Array.new
      @name = json["name"]
      @realm = json["realm"]
      @side = SIDES[json["side"]]
      # Optional fields
      @achievements = json["achievements"]
      @challenge = json["challenge"]
      #@news = GuildNews.new(json["news"])
      
      members = json["members"]
      
      if members != nil
        members.each do |member|
          character = BnetApi::WoW::CharacterProfile::Character.new_from_json(member["character"])
          character.rank = member["rank"]
          # Check character has a spec
          if member["character"]["spec"] != nil
            #character.spec = Spec.new(member["character"]["spec"])
          end
          @members.push(character)
        end
      end
      
      self
    end
  end
end