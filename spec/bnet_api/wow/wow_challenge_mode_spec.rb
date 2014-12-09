require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets a challenge mode realm leaderboard from the API" do
    leaderboard = BnetApi::WoW.challenge_mode_realm('Thunderhorn')

    expect(leaderboard['challenge']).not_to be_nil
  end

  it "gets a challenge mode region leaderboard from the API" do
    leaderboard = BnetApi::WoW.challenge_mode_region

    expect(leaderboard['challenge']).not_to be_nil
  end
end