module BnetApi::SC2
  class OAuthProfile
    attr_accessor :characters    
    
    def get
      BnetApi.api = :sc2
      json = BnetApi::Api.get("profile/user", true)
      
      @characters = Array.new
      
      json["characters"].each do |character|
        @characters.push(BnetApi::SC2::Character.new(character))
      end      
    end
    
  end
end