require 'spec_helper'

describe BnetApi::D3::CareerProfile do
  before :all do
    @career_profile = BnetApi::D3::CareerProfile.find_by_battle_tag("Ragwolf#2851")
  end
  
  describe "::find_by_battle_tag" do
    it "takes one parameter and returns a BnetApi::D3::CareerProfile object" do
      expect(@career_profile).to be_an_instance_of BnetApi::D3::CareerProfile
    end
  end
  
end