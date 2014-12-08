require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets the URL of an auction data dump from the API" do
    auction_data = BnetApi::WoW.auction_data('Thunderhorn')

    expect(auction_data['files']).not_to be_nil
    expect(auction_data['files'][0]['url']).not_to be_nil
    expect(auction_data['files'][0]['lastModified']).not_to be_nil
  end
end