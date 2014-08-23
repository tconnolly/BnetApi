require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'turn'

require 'bnet_api'

Turn.config do |c|
  # :outline - turn's original case/test outline mode [default]
  c.format = :outline
  # turn on invoke/execute tracing, enable full backtrace
  c.trace = true
  # use humanized test names (works only with :outline format)
  c.natural = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/bnet_api_cassettes'
  c.hook_into :webmock
end

BnetApi.configure do |c|
  c.api_key = :wnahbngtrs3maxkmya6ga8q5dvm78v23
end