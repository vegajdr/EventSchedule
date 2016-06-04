require 'sinatra/base'
require 'sinatra/json'
require 'json'
require './event'
require './compare'
require 'pry'
require './weather_parser'

class EventApp < Sinatra::Base
  set :logging, true
  set :show_exceptions, false
  error do |e|
    raise e
  end

  DB = {}

  before do
    require_authorization!
  end

  get "/events" do

    DB[username] ||= []
    json DB[username].map { |e| e.to_hash }
  end

  post "/events" do
    database
    database.parse!



    body = request.body.read

    begin
      new_item = JSON.parse body
    rescue
      status 400
      halt "Can't parse json: '#{body}'"
    end

    event = Event.new(
    description: new_item["description"],
    title: new_item["title"],
    day: new_item["day"],
    month: new_item["month"],
    year: new_item["year"],
    zip_code: new_item["zip_code"])

    comparison = comparison event, database
    forecast = comparison.match?
    event.forecast = forecast


    DB[username] ||= []
    DB[username].push event
  end

  def database
    data = WeatherParser.new
    data.parse!
    return data
  end

  def comparison event, parsed_database
    Compare.new event, parsed_database
  end
  #
  # patch "/list" do
  #   title = params[:title]
  #   DB[username] ||= []
  #   existing_item = DB[username].find { |i| i["title"] == title }
  #   if existing_item
  #     DB[username].delete existing_item
  #     status 200
  #   else
  #     status 404
  #   end
  # end

  def require_authorization!
    unless username
      status 401
      halt({ error: "You must log in" }.to_json)
    end
  end

  def username
    request.env["HTTP_AUTHORIZATION"]
  end
end

# if $0 == __FILE__
if $PROGRAM_NAME == __FILE__
  EventApp.run!
end
