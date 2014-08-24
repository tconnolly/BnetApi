module BnetApi::WoW
  class Character
    attr_accessor :achievement_points,
                  :battlegroup,
                  :class_name,
                  :gender,
                  :last_modified,
                  :level,
                  :name,
                  :race,
                  :realm,
                  :thumbnail,
                  :total_honorable_kills,
                  # Optional fields
                  :achievements,
                  :appearance,
                  :guild,
                  :guild_name,
                  :guild_realm,
                  :items,
                  :mounts,
                  :pets,
                  :professions,
                  :progression,
                  :pvp,
                  :quests,
                  :rank, # Guild rank
                  :reputation,
                  :spec, # Talent specialisation
                  :stats,
                  :talents,
                  :titles
                  
    CLASSES = {
      1  => "Warrior",
      2  => "Paladin",
      3  => "Hunter",
      4  => "Rogue",
      5  => "Priest",
      6  => "Death Knight",
      7  => "Shaman",
      8  => "Mage",
      9  => "Warlock",
      10 => "Monk",
      11 => "Druid"
    }

    GENDERS = {
      0 => "Male",
      1 => "Female"
    }

    RACES = {
      1  => "Human",
      2  => "Orc",
      3  => "Dwarf",
      4  => "Night Elf",
      5  => "Undead",
      6  => "Tauren",
      7  => "Gnome",
      8  => "Troll",
      9  => "Goblin",
      10 => "Blood Elf",
      11 => "Draenei",
      22 => "Worgen",
      24 => "Pandaren",
      25 => "Pandaren",
      26 => "Pandaren"
    }
    
    def initialize(realm, name)
      @realm = realm
      @name = name
    end
    
    def get(*options)
      BnetApi.api = :wow
      
      # Request all optional fields
      if options.include? :all
        fields = { :fields => "achievements,appearance,guild,items,mounts,pets,professions,progression,pvp,quests,reputation,stats,talents,titles"}
      else
        fields = { :fields => options.join(",") } unless options.empty?
      end
      
      json = BnetApi::Api.get("character/#{@realm}/#{@name}", nil, fields)
      
      unless json == nil
        @achievement_points = json["achievementPoints"]
        @battlegroup = json["battlegroup"]
        @class_name = CLASSES[json["class"]]
        @gender = GENDERS[json["gender"]]
        @lastModified = json["lastModified"]
        @level = json["level"]
        @name = json["name"]
        @race = RACES[json["race"]]
        @realm = json["realm"]
        @thumbnail = json["thumbnail"]
        @total_honorable_kills = json["totalHonorableKills"]
        # Get optional fields
        @achievements = json["achievements"]
        @appearance = json["appearance"]
        @guild = json["guild"]
        @items = json["items"]
        @mounts = json["mounts"]
        @pets = json["pets"]
        @professions = json["professions"]
        @progression = json["progression"]
        @pvp = json["pvp"]
        @quests = json["quests"]
        @reputation = json["reputation"]
        @stats = json["stats"]
        @talents = json["talents"]
        @titles = json["titles"]
      end
      
      self
    end

    def class_name=(class_id)
      @class_name = CLASSES[class_id]
    end

    def class_name
      @class_name
    end
    
    def self.new_from_guild(json)
      c = Character.new(json["realm"], json["name"])      
      
      c.achievement_points = json["achievementPoints"]
      c.battlegroup = json["battlegroup"]
      c.class_name = CLASSES[json["class"]]
      c.gender = GENDERS[json["gender"]]
      c.level = json["level"]
      c.name = json["name"]
      c.race = RACES[json["race"]]
      c.realm = json["realm"]
      c.thumbnail = json["thumbnail"]
      # Get optional fields
      c.guild_name = json["guild"]
      c.guild_realm = json["guildRealm"]
      
      c
    end
    
  end
end