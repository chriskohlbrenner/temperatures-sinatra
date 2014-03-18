class ForecastsController < ApplicationController
  get '/forecasts' do
    @forecast = Forecast.all.last
    # binding.pry
    erb :"forecasts/index.html"
  end


  post '/forecasts' do
    @forecast = Forecast.new(:zipcode => params[:zipcode])
    @scraper = Scraper.new(params[:zipcode])
    @forecast.location = @scraper.location
    @forecast.temperature = @scraper.temperature
    # @forecast.location = params[:location]
    # @forecast.temperature = params[:temperature]

    if @forecast.save
      redirect "/forecasts"
    else
      "Sorry, that's not a valid zipcode.<br><a href="">Back to the homepage.</a>"
    end
  end


end
