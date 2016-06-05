require "./weather_parser"
require "pry"
require "./event"

class Compare

attr_reader :event, :parser

  def initialize event, parser
    @event = event
    @parser = parser
  end

  def match?
    search = parser.db.detect do | forecast |
      event.day == forecast.day && event.month == forecast.month
    end

    if search != nil
      return search.to_hash
    else
      return nil
    end

  end

end
