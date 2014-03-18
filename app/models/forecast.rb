# require_relative '../../config/environment'
# require 'nokogiri'
# require 'open-uri'

class Forecast < ActiveRecord::Base
  validates_presence_of :location
# search zipcode
# Forecast.zipcode = search
# Scraper.new(search)
# Forecast.location = Scraper.location
# Forecast.temperature = Scraper.temperature
end