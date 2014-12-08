# encoding: UTF-8

require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "gets a character from the API" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf')

    expect(character['lastModified']).not_to be_nil
    expect(character['name']).to eq('Ragwolf')
    expect(character['realm']).to eq('Thunderhorn')
    expect(character['battlegroup']).to eq('Misery')
    expect(character['classId']).to eq(8)
    expect(character['race']).to eq(5)
    expect(character['gender']).to eq(1)
    expect(character['level']).to eq(100)
    expect(character['achievementPoints']).not_to be_nil
    expect(character['thumbnail']).not_to be_nil
  end

  it "gets a character from the API with achievement data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :achievements)

    expect(character['achievements']).not_to be_nil
  end

  it "gets a character from the API with appearance data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :appearance)

    expect(character['appearance']).not_to be_nil
  end

  it "gets a character from the API with feed data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :feed)

    expect(character['feed']).not_to be_nil
  end

  it "gets a character from the API with guild data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :guild)

    expect(character['guild']).not_to be_nil
  end

  it "gets a character from the API with hunterPets data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Cruorfang', :hunterPets)

    expect(character['hunterPets']).not_to be_nil
  end

  it "gets a character from the API with items data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :items)

    expect(character['items']).not_to be_nil
  end

  it "gets a character from the API with mounts data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :mounts)

    expect(character['mounts']).not_to be_nil
  end

  it "gets a character from the API with pets data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :pets)

    expect(character['pets']).not_to be_nil
  end

  it "gets a character from the API with petSlots data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :petSlots)

    expect(character['petSlots']).not_to be_nil
  end

  it "gets a character from the API with progression data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :progression)

    expect(character['progression']).not_to be_nil
  end

  it "gets a character from the API with pvp data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :pvp)

    expect(character['pvp']).not_to be_nil
  end

  it "gets a character from the API with quests data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :quests)

    expect(character['quests']).not_to be_nil
  end

  it "gets a character from the API with itemsreputation" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :reputation)

    expect(character['reputation']).not_to be_nil
  end

  it "gets a character from the API with stats data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :stats)

    expect(character['stats']).not_to be_nil
  end

  it "gets a character from the API with talents data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :talents)

    expect(character['talents']).not_to be_nil
  end

  it "gets a character from the API with titles data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :titles)

    expect(character['titles']).not_to be_nil
  end

  it "gets a character from the API with audit data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :audit)

    expect(character['audit']).not_to be_nil
  end

  it "gets a character from the API with all additional data" do
    character = BnetApi::WoW.character('Thunderhorn', 'Ragwolf', :all)

    expect(character['achievements']).not_to be_nil
    expect(character['appearance']).not_to be_nil
    expect(character['feed']).not_to be_nil
    expect(character['guild']).not_to be_nil
    expect(character['items']).not_to be_nil
    expect(character['mounts']).not_to be_nil
    expect(character['pets']).not_to be_nil
    expect(character['petSlots']).not_to be_nil
    expect(character['progression']).not_to be_nil
    expect(character['pvp']).not_to be_nil
    expect(character['quests']).not_to be_nil
    expect(character['reputation']).not_to be_nil
    expect(character['stats']).not_to be_nil
    expect(character['talents']).not_to be_nil
    expect(character['titles']).not_to be_nil
    expect(character['audit']).not_to be_nil
  end
end