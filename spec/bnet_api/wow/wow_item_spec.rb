require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets an item from the API" do
    item = BnetApi::WoW.item(18803)

    expect(item['id']).to eq 18803
    expect(item['disenchantingSkillRank']).to eq 225
    expect(item['name']).to eq 'Finkle\'s Lava Dredger'
    expect(item['icon']).to eq 'inv_gizmo_02'
  end

  it "gets an item set from the API" do
    item_set = BnetApi::WoW.item_set(1060)

    expect(item_set['id']).to eq 1060
    expect(item_set['name']).to eq 'Deep Earth Vestments'
    expect(item_set['setBonuses']).not_to be_nil
    expect(item_set['items']).not_to be_nil
  end
end