require_relative '../../../spec_helper'

describe BnetApi::WoW::BattlePet::Stats do
  describe "default instance attributes" do
    
    let(:stats) { BnetApi::WoW::BattlePet::Stats.new(258, 25, 5, 4) }
    
    it "must have a breed id attribute" do
      stats.must_respond_to :breed_id
    end
    
    it "must have a health attribute" do
      stats.must_respond_to :health
    end
    
    it "must have a level attribute" do
      stats.must_respond_to :level
    end
    
    it "must have a pet quality id attribute" do
      stats.must_respond_to :pet_quality_id
    end
    
    it "must have a power attribute" do
      stats.must_respond_to :power
    end
    
    it "must have a species id attribute" do
      stats.must_respond_to :species_id
    end
    
    it "must have a speed attribute" do
      stats.must_respond_to :speed
    end
    
    describe "default instance methods" do
      let(:stats) { BnetApi::WoW::BattlePet::Stats.new(258, 25, 5, 4) }
      
      it "must have a get method" do
        stats.must_respond_to :get
      end
    end
    
    describe "GET species" do
    
      let(:stats) { BnetApi::WoW::BattlePet::Stats.new(258, 25, 5, 4) }
      
      before do
        VCR.insert_cassette "battle_pet_stats", record: :new_episodes
        
        stats.get
      end
      
      after do
        VCR.eject_cassette
      end
      
      it "must get the right stats" do
        stats.breed_id.must_equal 5
        stats.health.must_equal 1587
        stats.level.must_equal 25
        stats.pet_quality_id.must_equal 4
        stats.power.must_equal 315
        stats.species_id.must_equal 258
        stats.speed.must_equal 297
      end
      
      it "records the fixture" do
        stats.get
      end
    end
  end
end