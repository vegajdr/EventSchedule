# class WeatherParser
require "pry"
require 'json'
require "./forecast"

class WeatherParser

attr_reader :db, :data

  def initialize
    @data = JSON.parse(File.read("info.json"))
    @db = []
  end

  def parse!
    # @db[:day] = @data["forecast"]["simpleforecast"]["forecastday"].first["high"]["fahrenheit"]
    @data["forecast"]["simpleforecast"]["forecastday"].each do |day|
      binding.pry
    @db.push(Forecast.new(
    month: @data["forecast"]["simpleforecast"]["forecastday"][day]["date"]["month"],
    day: @data["forecast"]["simpleforecast"]["forecastday"][day]["date"]["day"],
    year: @data["forecast"]["simpleforecast"]["forecastday"][day]["date"]["year"],
    high: @data["forecast"]["simpleforecast"]["forecastday"][day]["high"]["fahrenheit"],
    low: @data["forecast"]["simpleforecast"]["forecastday"][day]["low"]["fahrenheit"]))
  end

  end


end

parser  = WeatherParser.new

parser.parse!

binding.pry
