require_relative '../../spec_helper'

describe BnetApi::D3::Hero do
  
  describe "GET hero" do
    
    let(:hero) { BnetApi::D3::Hero.new("Ragwolf#2851", 423386) }
    
    before do
      VCR.insert_cassette "hero", record: :new_episodes
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "must have id method" do
      hero.must_respond_to :id
    end
    
    it "must have class_name method" do
      hero.must_respond_to :class_name
    end
    
    #it "records the fixture" do
    #  BnetApi::D3::Hero.find_by_battle_tag_and_id("Ragwolf#2851", 423386)
    #end
  end
  
end