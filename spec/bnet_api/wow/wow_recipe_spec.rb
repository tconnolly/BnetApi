require 'spec_helper'

describe BnetApi::WoW do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_API_KEY']
      config.api_secret = ENV['BNET_API_SECRET']
    end
  end

  it "gets a recipe from the API" do
    recipe = BnetApi::WoW.recipe(33994)

    expect(recipe['id']).to eq 33994
    expect(recipe['name']).to eq 'Precise Strikes'
    expect(recipe['profession']).to eq 'Enchanting'
    expect(recipe['icon']).to eq 'spell_holy_greaterheal'
  end
end