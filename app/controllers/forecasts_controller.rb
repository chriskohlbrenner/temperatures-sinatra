class ForecastsController < ApplicationController
  get '/' do
    redirect to "/forecasts"
  end

  get '/forecasts' do
    request = Rack::Request.new(env)
    lat = request.location.data['latitude']
    long = request.location.data['longitude']
    latlong = lat.to_s + "," + long.to_s
    
    if Geocoder.search(latlong)[0]
      forecast_zipcode = Geocoder.search(latlong)[0].data["address_components"].last["long_name"]
      @current_loc = Geocoder.search(latlong)[1].data["formatted_address"] + "."
    else
      forecast_zipcode = "10001"
      @current_loc = "could not be found."
    end

    @forecast = Forecast.new(:zipcode => forecast_zipcode)
    @scraper = Scraper.new(forecast_zipcode)
    @forecast.location = @scraper.location
    @forecast.temperature = @scraper.temperature
    @forecast.high_tomorrow = @scraper.high_tomorrow
    @forecast.low_tomorrow = @scraper.low_tomorrow
    @forecast.save
    erb :"forecasts/index.html"
  end

  post '/forecasts' do
    @forecast = Forecast.new(:zipcode => params[:zipcode])
    @scraper = Scraper.new(params[:zipcode])
    @forecast.location = @scraper.location
    @forecast.temperature = @scraper.temperature
    @forecast.high_tomorrow = @scraper.high_tomorrow
    @forecast.low_tomorrow = @scraper.low_tomorrow
      
    if @forecast.save
      erb :"forecasts/index.html"
    else
      "Sorry, that's not a valid zipcode.<br><a href="">Back to the homepage.</a>"
    end
  end

end