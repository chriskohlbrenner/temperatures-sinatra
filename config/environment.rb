require 'bundler/setup'
Bundler.require(:default)

require_relative '../app/models/forecast'
require_relative '../app/models/scraper'

require_relative '../app/controllers/application_controller'
require_relative '../app/controllers/forecasts_controller'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => 'db/development.sqlite3'
)
