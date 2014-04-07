require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(zipcode)
    @doc = Nokogiri::HTML(open("http://www.weather.com/weather/today/#{zipcode}"))
    @forecast_doc = Nokogiri::HTML(open("http://www.weather.com/weather/hourbyhour/graph/#{zipcode}"))
  end

  def temperature
    @temperature = @doc.css("div.wx-temperature span[itemprop=temperature-fahrenheit]").text
  end

  def location
    @location = @doc.css("div.wx-location-title").text.gsub(/\d|\(|\)|Weather/, "").gsub("\n","")
  end

  def forecast
    @forecast = nil#add parsing here
  end
end