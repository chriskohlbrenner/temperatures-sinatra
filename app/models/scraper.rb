require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(zipcode)
    @doc = Nokogiri::HTML(open("http://www.weather.com/weather/today/#{zipcode}"))
    @forecast_tomorrow = Nokogiri::HTML(open("http://www.weather.com/weather/tomorrow/#{zipcode}"))
  end

  def temperature
    @doc.css("div.wx-temperature span[itemprop=temperature-fahrenheit]").text
  end

  def location
    @doc.css("div.wx-location-title").text.gsub(/\d|\(|\)|Weather/, "").gsub("\n","")
  end

  def high_tomorrow
    @forecast_tomorrow.css("p.wx-temp").text.chomp.gsub("°","").gsub("F","").gsub(/High(.*?)Low/, "").strip
  end

  def low_tomorrow
    @forecast_tomorrow.css("p.wx-temp").text.chomp.gsub("°","").gsub("F","").gsub(/(.*?)High/,"").gsub("Low","").strip
  end
end