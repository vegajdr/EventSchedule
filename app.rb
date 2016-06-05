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

  def database
    data = WeatherParser.new
    data.parse!
    return data
  end

  def comparison event, parsed_database
    Compare.new event, parsed_database
  end

  def create_event request
    Event.new(
    description: request["description"],
    title: request["title"],
    day: request["day"],
    month: request["month"],
    year: request["year"],
    zip_code: request["zip_code"])
  end

  def require_authorization!
    username = true
    unless username
      status 401
      halt({ error: "You must log in" }.to_json)
    end
  end

  def username
    request.env["HTTP_AUTHORIZATION"]
  end

  DB = {}

  before do
    require_authorization!
  end

    get '/' do
      erb :events
      binding.pry
    end

  get "/events" do

    DB[username] ||= []
    body json DB[username].map { |e| e.to_hash }
  end

  get "/events/:month/:day/:year" do
    month = params[:month].to_i
    day = params[:day].to_i
    year = params[:year].to_i

    match = DB[username].detect do |event|
      event.day == day && event.month == month
    end

    if match
      status 200
      body json match.to_hash
    else
      status 404
    end

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

    event = create_event new_item
    comparison = comparison event, database
    forecast = comparison.match?
    event.forecast = forecast
#
    DB[username] ||= []
    DB[username].push event
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

end

# if $0 == __FILE__
if $PROGRAM_NAME == __FILE__
  EventApp.run!
end
