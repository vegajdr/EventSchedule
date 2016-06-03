require 'pry'
require "json"
require "./weatherParser"


  a =  File.read("weather.txt").chomp
  data = JSON.parse a

class Forecast
  # Data = JSON.parse(File.read("weather.txt").chomp)

  attr_reader :day, :month, :year, :high, :low

  def initialize month:, day:, year:, high:, low:
    @month = month
    @day = day
    @year = year
    @high = high
    @low = low
  end


  #
  # def high
  #   @data["forecast"]["simpleforecast"]["forecastday"].first["high"]["fahrenheit"]
  # end
  #
  # def low
  #   @data["forecast"]["simpleforecast"]["forecastday"].first["low"]["fahrenheit"]
  # end

  # use this to when combining information to match day and month to get weather
  # for the particular day
  #   def event_day_check
  #     e = Event.new
  #     f = Forecast.new(zipcode)
  #   if e.day && a.month == f.day && f.month
  #     return weather_data
  #   else
  #     return "Can't predict the future."
  #   end
  # end
end
# 
# t = Forecast.new data
