require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets a list of battlegroups from the API" do
    battlegroups = BnetApi::WoW::Data.battlegroups

    expect(battlegroups['battlegroups']).not_to be_nil
  end

  it "gets a list of character races from the API" do
    races = BnetApi::WoW::Data.character_races

    expect(races['races']).not_to be_nil
  end

  it "gets a list of character classes from the API" do
    classes = BnetApi::WoW::Data.character_classes

    expect(classes['classes']).not_to be_nil
  end

  it "gets a list of character achievements from the API" do
    achievements = BnetApi::WoW::Data.character_achievements

    expect(achievements['achievements']).not_to be_nil
  end

  it "gets a list of guild rewards from the API" do
    rewards = BnetApi::WoW::Data.guild_rewards

    expect(rewards['rewards']).not_to be_nil
  end

  it "gets a list of guild perks from the API" do
    perks = BnetApi::WoW::Data.guild_perks

    expect(perks['perks']).not_to be_nil
  end

  it "gets a list of guild achievements from the API" do
    achievements = BnetApi::WoW::Data.guild_achievements

    expect(achievements['achievements']).not_to be_nil
  end

  it "gets a list of item classes from the API" do
    classes = BnetApi::WoW::Data.item_classes

    expect(classes['classes']).not_to be_nil
  end

  it "gets a list of talents from the API" do
    talents = BnetApi::WoW::Data.talents

    expect(talents['1']).not_to be_nil
    expect(talents['2']).not_to be_nil
    expect(talents['3']).not_to be_nil
    expect(talents['4']).not_to be_nil
    expect(talents['5']).not_to be_nil
    expect(talents['6']).not_to be_nil
    expect(talents['7']).not_to be_nil
    expect(talents['8']).not_to be_nil
    expect(talents['9']).not_to be_nil
    expect(talents['10']).not_to be_nil
    expect(talents['11']).not_to be_nil
  end

  it "gets a list of pet types from the API" do
    petTypes = BnetApi::WoW::Data.pet_types

    expect(petTypes['petTypes']).not_to be_nil
  end
end