class Event

  attr_reader :title, :description, :date, :zip_code

  def initialize title:, description:, date:, zip_code:
    @title = title
    @description = description
    @date = date
    @zip_code = zip_code

  end

  def to_hash
    { "title" => title,
      "description" => description,
      "date" => date,
      "zip_code" => zip_code
    }

  end


end
