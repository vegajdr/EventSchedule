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
    # month: data["forecast"]["simpleforecast"]["forecastday"],
    # day: parser.data["forecast"]["simpleforecast"]["forecastday"],


  end


end

parser  = WeatherParser.new

parser.parse!

binding.pry
