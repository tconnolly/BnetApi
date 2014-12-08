require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets a guild from the API" do
    guild = BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution')

    expect(guild['lastModified']).not_to be_nil
    expect(guild['name']).to eq('Banana Revolution')
    expect(guild['realm']).to eq('Thunderhorn')
    expect(guild['battlegroup']).to eq('Misery')
    expect(guild['level']).to eq(25)
    expect(guild['side']).to eq(1)
    expect(guild['achievementPoints']).not_to be_nil
    expect(guild['emblem']).not_to be_nil
  end

  it "gets a guild from the API with members data" do
    guild = BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :members)

    expect(guild['members']).not_to be_nil
  end

  it "gets a guild from the API with achievements data" do
    guild = BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :achievements)

    expect(guild['achievements']).not_to be_nil
  end

  it "gets a guild from the API with news data" do
    guild = BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :news)

    expect(guild['news']).not_to be_nil
  end

  it "gets a guild from the API with challenge data" do
    guild = BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :challenge)

    expect(guild['challenge']).not_to be_nil
  end

  it "gets a guild from the API with all additional data" do
    guild = BnetApi::WoW.guild('Thunderhorn', 'Banana Revolution', :all)

    expect(guild['members']).not_to be_nil
    expect(guild['achievements']).not_to be_nil
    expect(guild['news']).not_to be_nil
    expect(guild['challenge']).not_to be_nil
  end
end