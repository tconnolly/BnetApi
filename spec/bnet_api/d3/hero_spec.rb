require 'spec_helper'

describe BnetApi::D3::Hero do
  before :all do
    @career_profile = BnetApi::D3::CareerProfile.find_by_battle_tag("Ragwolf#2851")
    @hero = BnetApi::D3::Hero.find_by_battle_tag_and_id(@career_profile.battle_tag, @career_profile.heroes.first.id)
  end
  
  describe "::find_by_battle_tag_and_id" do
    it "takes two parameters and returns a BnetApi::D3::Hero object" do
      expect(@hero).to be_an_instance_of BnetApi::D3::Hero
    end
  end
  
end