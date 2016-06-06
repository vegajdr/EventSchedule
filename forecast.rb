require 'pry'
require "json"

class Forecast

  attr_reader :day, :month, :year, :high, :low

  def initialize month:, day:, year:, high:, low:
    @month = month
    @day = day
    @year = year
    @high = high
    @low = low
  end

  def to_hash
    {"high" => high,
    "low" => low}
  end
end


#
#
#   def event_day_check
#     e = Event.new
#     f = Forecast.new(zipcode)
#     if e.day && a.month == f.day && f.month
#       return weather_data
#     else
#       return "Can't predict the future. Try again closer to event"
#     end
#   end
# end
#
# #
# # t = Forecast.new data
