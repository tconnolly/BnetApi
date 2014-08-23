require_relative '../../spec_helper'

describe BnetApi::D3::CareerProfile do
  
  describe "default instance attributes" do
    
    let(:career_profile) { BnetApi::D3::CareerProfile.new("Ragwolf#2851") }
    
    it "must have a battle tag attribute" do
      career_profile.must_respond_to :battle_tag
    end
    
  end
  
  describe "GET career profile" do
    
    let(:career_profile) { BnetApi::D3::CareerProfile.new("Ragwolf#2851") }
    
    before do
      VCR.insert_cassette "career_profile", record: :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "must get the right career profile" do
      career_profile.get
      
      career_profile.battle_tag.must_equal "Ragwolf#2851"
      career_profile.fallen_heroes.must_be_empty
      career_profile.heroes.wont_be_empty
      career_profile.last_hero_played.must_equal 6121185
      career_profile.last_updated.must_equal Time.at(1408292757)
      career_profile.paragon_level.must_equal 57
      career_profile.paragon_level_hardcore.must_equal 0
      career_profile.progression.wont_be_empty
    end
    
    #it "records the fixture" do
    #  BnetApi::D3::CareerProfile.find_by_battle_tag("Ragwolf#2851")
    #end
  end
  
end