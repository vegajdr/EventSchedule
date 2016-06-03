  require 'pry'
  require "json"
  require "./key"
  # require "./forecast"
  require "HTTParty"

  # def zip_code
  #   #testing zipcode
  # end
  # zipcode = 27701

  def weather_data zipcode
    HTTParty.get(
    path = "http://api.wunderground.com/api/#{Key}/geolookup/forecast10day/q/#{zipcode}.json"
    )
  end

  f = File.open("info.json", "w")
  f.puts "#{weather_data("27513").to_json }"

  f.close


  # json["forecast"]["simpleforecast"]["forecastday"][0]["date"]
  #
  # raw = weather_data(zipcode)
  # weather = raw["forecast"]["simpleforecast"]["forecastday"][0]["high"]
  #     puts "The weather on the day of your event is: #{weather}"
  # binding.pry


  # #"http://api.wunderground.com/api/#{Wunderground_key}/geolookup/conditions/q/#{Zipcode}.json"
  #
  # key = "[REDACTED]"
  # zipcode = 27610
  # r = HTTParty.get(
  # "http://api.wunderground.com/api/#{key}/forecast10day/q/#{zipcode}.json"
  # #"http://api.wunderground.com/api/#{key}/planner_06020602/q/27703.json"
  # )
  #
  # # Planner endpoint
  # # r["trip"]["chance_of"]["chanceofprecip"]["percentage"]
  # # r["trip"]["temp_high"]["avg"]["F"]
  # # r["trip"]["temp_low"]["avg"]["F"]
  #
  # # Forecast endpoint
  # # r["forecast"]["simpleforecast"]["forecastday"].first["high"]
  #
  # binding.pry
  # puts
