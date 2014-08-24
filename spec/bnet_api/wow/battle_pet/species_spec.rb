require_relative '../../../spec_helper'

describe BnetApi::WoW::BattlePet::Species do
  
  describe "default instance attributes" do
    
    let(:species) { BnetApi::WoW::BattlePet::Species.new(258) }
    
    it "must have an abilities attribute" do
      species.must_respond_to :abilities
    end
    
    it "must have a can battle attribute" do
      species.must_respond_to :can_battle
    end
    
    it "must have a creature id attribute" do
      species.must_respond_to :creature_id
    end
    
    it "must have a description attribute" do
      species.must_respond_to :description
    end
    
    it "must have an icon attribute" do
      species.must_respond_to :icon
    end
    
    it "must have an id attribute" do
      species.must_respond_to :id
    end
    
    it "must have a name attribute" do
      species.must_respond_to :name
    end
    
    it "must have a pet type id attribute" do
      species.must_respond_to :pet_type_id
    end
    
    it "must have a source attribute" do
      species.must_respond_to :source
    end
    
  end
  
  describe "default instance methods" do
    
    let(:species) { BnetApi::WoW::BattlePet::Species.new(258) }
      
    it "must have a get method" do
      species.must_respond_to :get
    end
    
  end

  describe "GET species" do
    
    let(:species) { BnetApi::WoW::BattlePet::Species.new(258) }
    
    before do
      VCR.insert_cassette "battle_pet_species", record: :new_episodes
      
      species.get
    end
    
    after do
      VCR.eject_cassette
    end
    
    it "must get the right species" do
      species.abilities.wont_be_nil
      species.can_battle.must_equal true
      species.creature_id.must_equal 42078
      species.description.must_equal "Powerful artillery of the terran army. The Thor is always the first one in and the last one out!"
      species.icon.must_equal "t_roboticon"
      species.id.must_equal 258
      species.name.must_equal "Mini Thor"
      species.pet_type_id.must_equal 9
      species.source.must_equal "Promotion: StarCraft II: Wings of Liberty Collector's Edition"
    end
    
    it "records the fixture" do
      species.get
    end
  end
  
end