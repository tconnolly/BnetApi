require_relative '../../../spec_helper'

describe BnetApi::WoW::BattlePet::Ability do
  
  describe "default instance attributes" do
    
    let(:ability) { BnetApi::WoW::BattlePet::Ability.new(640) }
    
    it "must have a cooldown attribute" do
      ability.must_respond_to :cooldown
    end
    
  end
  
  describe "default instance methods" do
    
    let(:ability) { BnetApi::WoW::BattlePet::Ability.new(640) }
      
    it "must have a get method" do
      ability.must_respond_to :get
    end
    
  end
  
  describe "GET guild" do
    
    let(:ability) { BnetApi::WoW::BattlePet::Ability.new(640) }
    
    before do
      VCR.insert_cassette "battle_pet_ability", record: :new_episodes
      
      ability.get
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "must get the right ability" do
      ability.name.must_equal "Toxic Smoke"
    end
    
    it "records the fixture" do
      BnetApi::WoW::BattlePet::Ability.new(640).get
    end
  end
  
end