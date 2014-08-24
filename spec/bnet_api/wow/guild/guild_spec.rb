require_relative '../../../spec_helper'

describe BnetApi::WoW::Guild do
  
  describe "default instance attributes" do
    
    let(:guild) { BnetApi::WoW::Guild.new("Thunderhorn", "Banana Revolution") }
    
    it "must have an achievement points attribute" do
      guild.must_respond_to :achievement_points
    end
    
  end
  
  describe "default instance methods" do
    
    let(:guild) { BnetApi::WoW::Guild.new("Thunderhorn", "Banana Revolution") }
      
    it "must have a get method" do
      guild.must_respond_to :get
    end
    
  end
  
  describe "GET guild" do
    
    let(:guild) { BnetApi::WoW::OAuthProfile.new("Thunderhorn", "Banana Revolution") }
    
    before do
      VCR.insert_cassette "guild", record: :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "must get the right guild" do
      #guild.name.must_equal "Banana Revolution"
    end
    
    it "records the fixture" do
      BnetApi::WoW::Guild.new("Thunderhorn", "Banana Revolution").get(:all)
    end
  end
  
end