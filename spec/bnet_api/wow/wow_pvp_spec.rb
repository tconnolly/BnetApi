require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets a pvp leaderboard from the API" do
    leaderboard = BnetApi::WoW.pvp('2v2')

    expect(leaderboard['rows']).not_to be_nil
  end
end