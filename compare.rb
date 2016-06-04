require "./weather_parser"
require "pry"
require "./event"

# a = WeatherParser.new
# a.parse!

class Compare

attr_reader :event, :parser

  def initialize event, parser
    @event = event
    @parser = parser
  end

  def match?
    parser.db.detect do | forecast |
      event.day == forecast.day && event.month == forecast.month
    end
  end

end

# string =  '{"title": "Meeting", "description": "Strategy planning", "month": 6, "day": 4, "year": 2016, "zip_code": "27529" }'
# string = JSON.parse string
#
# event = Event.new(
#   description: string["description"],
#   title: string["title"],
#   day: string["day"],
#   month: string["month"],
#   year: string["year"],
#   zip_code: string["zip_code"])
#
#
# compare = Compare.new event, a
#
# forecast = compare.match?
#
# binding.pry
