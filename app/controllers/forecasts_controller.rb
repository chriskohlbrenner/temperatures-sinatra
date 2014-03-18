class ForecastsController < ApplicationController
  get '/forecasts' do
    @forecast = Forecast.all.last
    erb :"forecasts/index.html"
  end

  post '/forecasts' do
    @forecast = Forecast.new(:zipcode => params[:zipcode])
    @scraper = Scraper.new(params[:zipcode])
    @forecast.location = @scraper.location
    @forecast.temperature = @scraper.temperature

    if @forecast.save
      redirect "/forecasts"
    else
      "Sorry, that's not a valid zipcode.<br><a href="">Back to the homepage.</a>"
    end
  end

end


  # get '/forecasts' do
  #   if request.location.data["zipcode"] != ""
  #     zipcode = request.location.data["zipcode"]
  #     @scraper = Scraper.new(zipcode)
  #     @forecast = Forecast.new(:zipcode => zipcode)
  #     @forecast.location = @scraper.location
  #     @forecast.temperature = @scraper.temperature
  #   else
  #     @scraper = Scraper.new("10001")
  #     @forecast = Forecast.new(:zipcode => "10001")
  #     @forecast.location = @scraper.location
  #     @forecast.temperature = @scraper.temperature
  #   end