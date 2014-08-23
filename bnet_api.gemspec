$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bnet_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bnet_api"
  s.version     = BnetApi::VERSION
  s.authors     = ["Tom Connolly"]
  s.email       = ["tom@tconnolly.co.uk"]
  s.homepage    = "http://github.com/tconnolly/bnetapi"
  s.summary     = %q{Battle.net API wrapper}
  s.description = %q{Wrapper for Blizzard's Battle.net API}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "certified"
  s.add_dependency "omniauth-github"
  s.add_dependency "omniauth-bnet"
  
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "turn"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
end
