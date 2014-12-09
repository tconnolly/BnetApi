require 'spec_helper'

describe BnetApi::D3 do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets a career profile from the API" do
    profile = BnetApi::D3.career_profile('Ragwolf#2851')

    expect(profile['battleTag']).to eq 'Ragwolf#2851'
    expect(profile['heroes']).not_to be_nil
  end

  it "gets a hero profile from the API" do
    profile = BnetApi::D3.hero_profile('Ragwolf#2851', 47516365)

    expect(profile['name']).to eq 'Ragwolf'
    expect(profile['class']).to eq 'demon-hunter'
    expect(profile['skills']).not_to be_nil
  end

  it "gets the data for an item from the API" do
    item = BnetApi::D3.item_data('Co4BCJbokeUHEgcIBBV_-U5dHcj6vKAdjs3dnR2dB5UkHSCd5AQd6XAvux3DDZzlIgsIARW1RAMAGAogJjCLAjjqA0AASBNQEFgEYOwEaisKDAgAEMPSgK2BgIDAEhIbCJ7JnZUJEgcIBBUVn9irMIsCOABAAVgEkAEBpQEgneQErQFmIwZQuAHSiJmSBcABBhj-5ffUC1AAWAI')

    expect(item['id']).to eq 'Helm_208'
    expect(item['name']).to eq 'Prime Shelter'
    expect(item['icon']).to eq 'helm_208_demonhunter_male'
    expect(item['displayColor']).to eq 'yellow'
  end

  it "gets the data for the templar follower from the API" do
    follower = BnetApi::D3.follower_data('templar')

    expect(follower['slug']).to eq 'templar'
    expect(follower['name']).to eq 'Templar'
    expect(follower['realName']).to eq 'd3.follower.templar.realName'
    expect(follower['portrait']).to eq 'templar'
    expect(follower['skills']).not_to be_nil
  end

  it "gets the data for the enchantress follower from the API" do
    follower = BnetApi::D3.follower_data('enchantress')

    expect(follower['slug']).to eq 'enchantress'
    expect(follower['name']).to eq 'Enchantress'
    expect(follower['realName']).to eq 'd3.follower.enchantress.realName'
    expect(follower['portrait']).to eq 'enchantress'
    expect(follower['skills']).not_to be_nil
  end

  it "gets the data for the scoundrel follower from the API" do
    follower = BnetApi::D3.follower_data('scoundrel')

    expect(follower['slug']).to eq 'scoundrel'
    expect(follower['name']).to eq 'Scoundrel'
    expect(follower['realName']).to eq 'd3.follower.scoundrel.realName'
    expect(follower['portrait']).to eq 'scoundrel'
    expect(follower['skills']).not_to be_nil
  end

  it "gets the data for the blacksmith artisan from the API" do
    artisan = BnetApi::D3.artisan_data('blacksmith')

    expect(artisan['slug']).to eq 'blacksmith'
    expect(artisan['name']).to eq 'Blacksmith'
    expect(artisan['portrait']).to eq 'pt_blacksmith'
    expect(artisan['training']).not_to be_nil
  end

  it "gets the data for the jeweler artisan from the API" do
    artisan = BnetApi::D3.artisan_data('jeweler')

    expect(artisan['slug']).to eq 'jeweler'
    expect(artisan['name']).to eq 'Jeweler'
    expect(artisan['portrait']).to eq 'pt_jeweler'
    expect(artisan['training']).not_to be_nil
  end

  it "gets the data for the mystic artisan from the API" do
    artisan = BnetApi::D3.artisan_data('mystic')

    expect(artisan['slug']).to eq 'mystic'
    expect(artisan['name']).to eq 'Mystic'
    expect(artisan['portrait']).to eq 'pt_mystic'
    expect(artisan['training']).not_to be_nil
  end
end