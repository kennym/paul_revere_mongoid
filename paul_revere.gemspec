$:.push File.expand_path("../lib", __FILE__)
require "paul_revere_mongoid/version"

Gem::Specification.new do |s|
  s.name        = "paul_revere_mongoid"
  s.version     = PaulRevere::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Nick Quaranto', 'Matt Jankowski', 'Joe Ferris', 'Christopher Meiklejohn', 'Tammer Saleh', 'Jason Morrison', 'Gabe Berke-Williams', 'Kenny Meyer']
  s.email       = "support@thoughtbot.com"
  s.homepage    = "https://github.com/mirthworks/paul_revere_mongoid"
  s.summary     = "Simple announcement plugin to include 'one off' style announcements in Rails web apps - Mongoid port"
  s.description = "Paul Revere provides a model and helper methods to do one-off style announcements. This library provides the Mongoid port."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", "~> 3.0")
  s.add_dependency("mongoid", "~> 3.0")

  s.add_development_dependency("bson_ext")
  s.add_development_dependency("multi_json")
  s.add_development_dependency("mongoid-rspec", "<= 1.4.5")
  s.add_development_dependency("rspec-rails")
  s.add_development_dependency("mocha")
  s.add_development_dependency("appraisal")
  s.add_development_dependency("database_cleaner")
end
