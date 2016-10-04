require 'spec_helper'

describe BnetApi::SC2 do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets a profile from the API" do
    profile = BnetApi::SC2.profile(4587449, 1, 'Ragwolf')

    expect(profile['id']).to eq 4587449
    expect(profile['realm']).to eq 1
    expect(profile['displayName']).to eq 'Ragwolf'
    expect(profile['profilePath']).to eq '/profile/4587449/1/Ragwolf/'
    expect(profile['portrait']).not_to be_nil
    expect(profile['career']).not_to be_nil
    expect(profile['swarmLevels']).not_to be_nil
    expect(profile['campaign']).not_to be_nil
    expect(profile['season']).not_to be_nil
    expect(profile['rewards']).not_to be_nil
    expect(profile['achievements']).not_to be_nil
  end

  it "gets a profile's ladders from the API" do
    ladders = BnetApi::SC2.profile_ladders(4587449, 1, 'Ragwolf')

    expect(ladders['currentSeason']).not_to be_nil
    expect(ladders['previousSeason']).not_to be_nil
    expect(ladders['showcasePlacement']).not_to be_nil
  end

  it "gets a profile's match history from the API" do
    history = BnetApi::SC2.match_history(4587449, 1, 'Ragwolf')

    expect(history['matches']).not_to be_nil
  end

  it "gets a ladder from the API" do
    ladder = BnetApi::SC2.ladder(185245)

    expect(ladder['ladderMembers']).not_to be_nil
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