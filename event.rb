class Event

  attr_reader :title, :description, :date

  def initialize title:, description:, date:
    @title = title
    @description = description
    @date = date

  end

  def to_hash
    { "title" => title,
      "description" => description,
      "date" => date
    }

  end


end
