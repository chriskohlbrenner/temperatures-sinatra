class ForecastsController < ApplicationController
  get '/' do
    redirect to "/forecasts"
  end

  get '/forecasts' do
    # if request.location.data['zipcode'] != ""
    binding.pry
      request = Rack::Request.new(env)
      @data = request.location.data #['zipcode']
      forecast_zipcode = request.location.data['zipcode']
    # else
      # forecast_zipcode =  "10001"
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