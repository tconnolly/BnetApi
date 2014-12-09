require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets an achievement from the API" do
    achievement = BnetApi::WoW.achievement(2144)

    expect(achievement['id']).to eq 2144
    expect(achievement['title']).to eq 'What a Long, Strange Trip It\'s Been'
    expect(achievement['points']).to eq 50
    expect(achievement['description']).not_to be_nil
    expect(achievement['reward']).to eq 'Rewards: Violet Proto-Drake'
    expect(achievement['rewardItems']).not_to be_nil
    expect(achievement['icon']).to eq 'achievement_bg_masterofallbgs'
    expect(achievement['criteria']).not_to be_nil
    expect(achievement['accountWide']).to eq true
    expect(achievement['factionId']).to eq 2
  end
end