require_relative '../../../spec_helper'

describe BnetApi::WoW::BattlePet::Ability do
  
  describe "default instance attributes" do
    
    let(:ability) { BnetApi::WoW::BattlePet::Ability.new(640) }
    
    it "must have a cooldown attribute" do
      ability.must_respond_to :cooldown
    end
    
    it "must have an icon attribute" do
      ability.must_respond_to :icon
    end
    
    it "must have a hide hints attribute" do
      ability.must_respond_to :hide_hints
    end
    
    it "must have a is passive attibute" do
      ability.must_respond_to :is_passive
    end
    
    it "must have a name attribute" do
      ability.must_respond_to :name
    end
    
    it "must have a pet type id attribute" do
      ability.must_respond_to :pet_type_id
    end
    
    it "must have a rounds attribute" do
      ability.must_respond_to :rounds
    end
    
  end
  
  describe "default instance methods" do
    
    let(:ability) { BnetApi::WoW::BattlePet::Ability.new(640) }
      
    it "must have a get method" do
      ability.must_respond_to :get
    end
    
  end

  describe "GET ability" do
    
    let(:ability) { BnetApi::WoW::BattlePet::Ability.new(640) }
    
    before do
      VCR.insert_cassette "battle_pet_ability", record: :new_episodes
      
      ability.get
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "must get the right ability" do
      ability.cooldown.must_equal 0
      ability.hide_hints.must_equal false
      ability.icon.must_equal "spell_shadow_plaguecloud"
      ability.id.must_equal 640
      ability.is_passive.must_equal false
      ability.name.must_equal "Toxic Smoke"
      ability.pet_type_id.must_equal 9
      ability.rounds.must_equal 1
    end
    
    it "records the fixture" do
      BnetApi::WoW::BattlePet::Ability.new(640).get
    end
  end
  
end