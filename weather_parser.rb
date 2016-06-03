# class WeatherParser
require "pry"
require 'json'

class WeatherParser

attr_reader :db, :data

  def initialize
    @data = JSON.parse(File.read("info.json"))
    @db = {}
  end

  def parse!
    # @db[:day] = @data["forecast"]["simpleforecast"]["forecastday"].first["high"]["fahrenheit"]

    # Forecast.new
    # month: parser.data["forecast"]["simpleforecast"]["forecastday"][0]["date"]["month"]
    # day: parser.data["forecast"]["simpleforecast"]["forecastday"][0]["date"]["day"]
    # year: parser.data["forecast"]["simpleforecast"]["forecastday"][0]["date"]["year"]
    # high: parser.data["forecast"]["simpleforecast"]["forecastday"].first["high"]["fahrenheit"]
    # low: parser.data["forecast"]["simpleforecast"]["forecastday"].first["low"]["fahrenheit"]

  end


end

parser  = WeatherParser.new

parser.parse!

binding.pry
