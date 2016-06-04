class Event

  attr_accessor :title, :description, :day, :month, :year, :zip_code, :forecast

  def initialize title:, description:, day:, month:, year:, zip_code:, forecast: nil
    @title = title
    @description = description
    @month = month
    @day = day
    @year = year
    @zip_code = zip_code
    @forecast = forecast

  end

  def to_hash
    { "title" => title,
      "description" => description,
      "month" => month,
      "day" => day,
      "year" => year,
      "zip_code" => zip_code,
      "forecast" => forecast
    }

  end

end
