require 'spec_helper'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

Capybara.app = Rack::Builder.parse_file(File.expand_path("../../config.ru", __FILE__)).first

RSpec.configure do |config|
  config.include Capybara::DSL

end

