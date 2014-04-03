class ForecastsController < ApplicationController
  get '/' do
    redirect to "/forecasts"
  end

  get '/forecasts' do
    # binding.pry
    request = Rack::Request.new(env)
    latlong = request.location.data['latitude'] + "," + request.location.data['longitude']

    # if Geocoder.search(latlong)[0]
    #   forecast_zipcode = Geocoder.search(latlong)[0].data["address_components"].last["long_name"]
    # else
      forecast_zipcode = "10001"
    # end

    @forecast = Forecast.new(:zipcode => forecast_zipcode)
    @scraper = Scraper.new(forecast_zipcode)
    @forecast.location = @scraper.location
    @forecast.temperature = @scraper.temperature
    @forecast.save

    erb :"forecasts/index.html"
  end

  post '/forecasts' do
    @forecast = Forecast.new(:zipcode => params[:zipcode])
    @scraper = Scraper.new(params[:zipcode])
    @forecast.location = @scraper.location
    @forecast.temperature = @scraper.temperature

    if @forecast.save
      erb :"forecasts/index.html"
    else
      "Sorry, that's not a valid zipcode.<br><a href="">Back to the homepage.</a>"
    end
  end

end