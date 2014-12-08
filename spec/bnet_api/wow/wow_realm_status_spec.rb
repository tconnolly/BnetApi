require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets realm status data from the API" do
    realm_status = BnetApi::WoW.realm_status

    expect(realm_status['realms']).not_to be_nil
  end

  it "gets realm status data for specified realms from the API" do
    realm_status = BnetApi::WoW.realm_status('Thunderhorn')

    expect(realm_status['realms']).not_to be_nil
    expect(realm_status['realms'].count).to eq 1
    expect(realm_status['realms'][0]['name']).to eq 'Thunderhorn'
  end
end