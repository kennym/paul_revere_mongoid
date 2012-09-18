# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "mongoid"
require "mongoid-rspec"
require "database_cleaner"
require "rspec/rails"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include Mongoid::Matchers

  Mongoid.load!(File.expand_path("../dummy/config/mongoid.yml", __FILE__))

  # == Mock Framework
  config.mock_with :mocha

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

  # Remove announcements before each example
  config.before(:each) do
    DatabaseCleaner.clean
  end
end
