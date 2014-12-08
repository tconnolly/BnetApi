require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets a spell from the API" do
    spell = BnetApi::WoW.spell(8056)

    expect(spell['id']).to eq 8056
    expect(spell['name']).to eq 'Frost Shock'
    expect(spell['icon']).to eq 'spell_frost_frostshock'
    expect(spell['description']).not_to be_nil
    expect(spell['range']).to eq '25 yd range'
    expect(spell['powerCost']).to eq '1.25% of base mana'
    expect(spell['castTime']).to eq 'Instant'
    expect(spell['cooldown']).to eq '6 sec cooldown'
  end
end