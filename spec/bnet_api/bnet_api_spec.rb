require 'spec_helper'

describe BnetApi do

  before :each do
    BnetApi.configure do |config|
      config.api_key = ENV['BNET_ID']
      config.api_secret = ENV['BNET_SECRET']
    end
  end

  it "sets up the configuration" do
    expect(BnetApi.config.region).to eq(:eu)
    expect(BnetApi.config.locale).to eq(:en_GB)
    expect(BnetApi.config.api_key).to eq(ENV['BNET_ID'])
    expect(BnetApi.config.api_secret).to eq(ENV['BNET_SECRET'])
  end
end