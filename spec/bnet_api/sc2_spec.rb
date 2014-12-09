require 'spec_helper'

describe BnetApi::SC2 do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  # TODO: Implement test correctly
  it "gets a profile from the API" do
    profile = BnetApi::SC2.profile(123, 12345, 'TODO')
  end

  # TODO: Implement test correctly
  it "gets a profile's ladders from the API" do
    ladders = BnetApi::SC2.profile_ladders(123, 12345, 'TODO')
  end

  # TODO: Implement test correctly
  it "gets a profile's match history from the API" do
    history = BnetApi::SC2.match_history(123, 12345, 'TODO')
  end

  # TODO: Implement test correctly
  it "gets a ladder from the API" do
    ladder = BnetApi::SC2.ladder(12345)
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