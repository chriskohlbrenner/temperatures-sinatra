task :environment do
  require_relative './config/environment'
end

namespace :db do
  task :migrate => [:environment] do
    require_relative './db/migrate/01_create_forecasts'
    CreateForecasts.migrate(:up)
  end

  task :seed => [:environment] do
    post = Forecast.create(:location => "Paris, France", :temperature => "50°F")
  end
end
