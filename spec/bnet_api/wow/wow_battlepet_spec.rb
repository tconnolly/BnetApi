require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets a battlepet ability from the API" do
    ability = BnetApi::WoW.battlepet_ability(640)

    expect(ability['id']).to eq 640
    expect(ability['name']).to eq 'Toxic Smoke'
    expect(ability['icon']).to eq 'spell_shadow_plaguecloud'
    expect(ability['cooldown']).to eq 0
    expect(ability['rounds']).to eq 1
    expect(ability['petTypeId']).to eq 9
    expect(ability['isPassive']).to eq false
    expect(ability['hideHints']).to eq false
  end

  it "gets a battlepet species from the API" do
    species = BnetApi::WoW.battlepet_species(258)

    expect(species['speciesId']).to eq 258
    expect(species['petTypeId']).to eq 9
    expect(species['creatureId']).to eq 42078
    expect(species['name']).to eq 'Mini Thor'
    expect(species['canBattle']).to eq true
    expect(species['icon']).to eq 't_roboticon'
    expect(species['description']).not_to be_nil
    expect(species['source']).not_to be_nil
    expect(species['abilities']).not_to be_nil
  end

  it "gets battlepet stats data from the API" do
    stats = BnetApi::WoW.battlepet_stats(258, level: 25, breedId: 5, qualityId: 4)

    expect(stats['speciesId']).to eq 258
    expect(stats['breedId']).to eq 5
    expect(stats['petQualityId']).to eq 4
    expect(stats['level']).to eq 25
    expect(stats['health']).to eq 1587
    expect(stats['power']).to eq 315
    expect(stats['speed']).to eq 297
  end
end