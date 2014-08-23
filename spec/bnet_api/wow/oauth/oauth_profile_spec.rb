require_relative '../../../spec_helper'

describe BnetApi::WoW::OAuthProfile do
  
  describe "default instance attributes" do
    
    #let(:career_profile) { BnetApi::D3::CareerProfile.new("Ragwolf#2851") }
    
    #
    
  end
  
  describe "GET oauth profile" do
    
    #let(:career_profile) { BnetApi::D3::CareerProfile.new("Ragwolf#2851") }
    
    before do
      VCR.insert_cassette "oauth_profile", record: :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "records the fixture" do
      BnetApi.oauth_token = :nfpead9ubmch2f2g5xt4gxxh
      BnetApi::WoW::OAuthProfile.new.get
    end
  end
  
end