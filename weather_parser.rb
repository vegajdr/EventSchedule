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
    
    @db.push(Forecast.new(
    month: day["date"]["month"],
    day: day["date"]["day"],
    year: day["date"]["year"],
    high: day["high"]["fahrenheit"],
    low: day["low"]["fahrenheit"]))
  end

  end


end

parser  = WeatherParser.new

parser.parse!

binding.pry
