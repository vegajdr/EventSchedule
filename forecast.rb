require 'pry'
require "json"
require "./weatherParser"

class Forecast
  Data = []

attr_reader :day, :month
  def initialize(zipcode)
    @day = ["forecast"]["simpleforecast"]["forecastday"][0]["date"]["day"]
    @month = ["forecast"]["simpleforecast"]["forecastday"][0]["date"]["month"]
  end


  raw = weather_data(zipcode)
  def high
    raw["forecast"]["simpleforecast"]["forecastday"].first["high"]["fahrenheit"]
  end

  def low
    raw["forecast"]["simpleforecast"]["forecastday"].first["low"]["fahrenheit"]
  end

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
