module BnetApi::SC2
  class Character
    attr_accessor :id,
                  :achievements,
                  :avatar,
                  :campaign,
                  :career,
                  :clan_name,
                  :clan_tag,
                  :display_name,
                  :name,
                  :portrait,
                  :profile_path,
                  :realm,
                  :rewards,
                  :season,
                  :swarm_levels
                  
    def initialize(json)
      
    end
  end
end