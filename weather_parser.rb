# class WeatherParser
require "pry"
require 'json'
require "./forecast"


# def get_weather_data zipcode
#
#   HTTParty.get "http://api.wunderground.com/api/#{WundergroundKey}/forecast/geolookup/conditions/q/#{zipcode}.json"
#
# end
#
#
# r = get_weather_data "27513"

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

  #def import


end
