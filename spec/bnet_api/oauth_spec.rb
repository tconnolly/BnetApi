require 'spec_helper'

describe BnetApi::OAuth do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets an account ID from the API" do
    account = BnetApi::OAuth.account_id(ENV['BNET_API_OAUTH_ACCESS_TOKEN'])

    expect(account['id']).to eq 50804047
  end

  it "gets a battletag from the API" do
    account = BnetApi::OAuth.battletag(ENV['BNET_API_OAUTH_ACCESS_TOKEN'])

    expect(account['battletag']).to eq 'Ragwolf#2851'
  end

  it "gets a Starcraft II profile from the API" do
    profile = BnetApi::OAuth.sc2_profile(ENV['BNET_API_OAUTH_ACCESS_TOKEN'])

    expect(profile['characters']).not_to be_nil
  end

  it "gets a World of Warcraft profile from the API" do
    profile = BnetApi::OAuth.wow_profile(ENV['BNET_API_OAUTH_ACCESS_TOKEN'])

    expect(profile['characters']).not_to be_nil
  end
end