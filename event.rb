class Event

  attr_reader :title, :description, :date

  def initialize title:, description:, date:
    @title = title
    @description = description
    @date = date

  end

  def jasonify
    { "title" => title,
      "description" => description,
      "date" => date
    }.to_json

  end


end
