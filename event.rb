class Event

  attr_accessor :title, :description, :day, :month, :year, :zipcode, :forecast

  def initialize title:, description:, day:, month:, year:, zipcode:, forecast: nil
    @title = title
    @description = description
    @month = month
    @day = day
    @year = year
    @zipcode = zipcode
    @forecast = forecast

  end

  def to_hash
    { "title" => title,
      "description" => description,
      "month" => month,
      "day" => day,
      "year" => year,
      "zipcode" => zipcode,
      "forecast" => forecast
    }

  end

end
