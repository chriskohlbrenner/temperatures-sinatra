require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(zipcode)
    @doc = Nokogiri::HTML(open("http://www.weather.com/weather/today/#{zipcode}"))
  end

  def temperature
    @temperature = @doc.css("div.wx-temperature span[itemprop=temperature-fahrenheit]").text + "°F"
  end

  def location
    @location = @doc.css("div.wx-location-title").text.gsub(/\d|\(|\)|Weather/, "").gsub("\n","")
  end
end