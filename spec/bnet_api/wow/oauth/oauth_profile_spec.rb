require_relative '../../../spec_helper'

describe BnetApi::WoW::OAuthProfile do
  
  describe "default instance attributes" do
    
    let(:oauth_profile) { BnetApi::WoW::OAuthProfile.new }
    
    it "must have a characters attribute" do
      oauth_profile.must_respond_to :characters
    end
    
  end
  
  describe "default instance methods" do
    
    let(:oauth_profile) { BnetApi::WoW::OAuthProfile.new }
      
    it "must have a get method" do
      oauth_profile.must_respond_to :get
    end
    
  end
  
  describe "GET oauth profile" do
    
    let(:oauth_profile) { BnetApi::WoW::OAuthProfile.new }
    
    before do
      VCR.insert_cassette "oauth_profile", record: :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "must get the right oauth profile" do
      BnetApi.oauth_token = :nfpead9ubmch2f2g5xt4gxxh
      oauth_profile.get
      
      oauth_profile.characters.wont_be_nil
    end
    
    #it "records the fixture" do
    #  BnetApi.oauth_token = :nfpead9ubmch2f2g5xt4gxxh
    #  o = BnetApi::WoW::OAuthProfile.new
    #  o.get
    #end
  end
  
end