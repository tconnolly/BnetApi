require 'spec_helper'

describe BnetApi::SC2 do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets achievements data from the API" do
    achievements = BnetApi::SC2.achievements_data

    expect(achievements['achievements']).not_to be_nil
  end

  it "gets rewards data from the API" do
    rewards = BnetApi::SC2.rewards_data

    expect(rewards['portraits']).not_to be_nil
    expect(rewards['terranDecals']).not_to be_nil
    expect(rewards['zergDecals']).not_to be_nil
    expect(rewards['protossDecals']).not_to be_nil
    expect(rewards['skins']).not_to be_nil
    expect(rewards['animations']).not_to be_nil
  end

end