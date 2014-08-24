module BnetApi::WoW
  class OAuthProfile
    attr_accessor :characters
    
    def get
      BnetApi.api = :wow
      json = BnetApi::Api.get("user/characters", true)
      
      @characters = Array.new
      
      json["characters"].each do |character|
        @characters.push(BnetApi::WoW::Character.new_from_json(character))
      end
    end
  end
end