require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets a quest from the API" do
    quest = BnetApi::WoW.quest(13146)

    expect(quest['id']).to eq 13146
    expect(quest['title']).to eq 'Generosity Abounds'
    expect(quest['reqLevel']).to eq 77
    expect(quest['suggestedPartyMembers']).to eq 0
    expect(quest['category']).to eq 'Icecrown'
    expect(quest['level']).to eq 80
  end
end