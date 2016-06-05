# class WeatherParser
require "pry"
require 'json'
require "./forecast"
require "./key"
require "httparty"




class WeatherParser

attr_reader :db, :data

  def initialize zipcode
    # @data = JSON.parse(File.read("info.json"))
    @data = HTTParty.get "http://api.wunderground.com/api/#{Key}/geolookup/forecast10day/q/#{zipcode}.json"
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

  def weather_data zipcode
    HTTParty.get(
    path = "http://api.wunderground.com/api/#{Key}/geolookup/forecast10day/q/#{zipcode}.json"
    )
  end

  # def get_weather_data zipcode
  #
  #   HTTParty.get "http://api.wunderground.com/api/#{WundergroundKey}/forecast/geolookup/conditions/q/#{zipcode}.json"
  #
  # end
  #
  #
  # r = get_weather_data "27513"
  #def import


end
