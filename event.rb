class Event

  attr_reader :title, :description, :day, :month, :year, :zip_code

  def initialize title:, description:, day:, month:, year:, zip_code:
    @title = title
    @description = description
    @month = month
    @day = day
    @year = year
    @zip_code = zip_code

  end

  def to_hash
    { "title" => title,
      "description" => description,
      "month" => month,
      "day" => day,
      "year" => year,
      "zip_code" => zip_code
    }

  end

end
