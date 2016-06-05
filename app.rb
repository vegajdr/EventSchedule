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

  def weather_api_data zipcode
    data = WeatherParser.new zipcode
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
    zipcode: request["zipcode"])
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
      erb :username
    end

    post '/' do
      erb :dashboard
    end

    post '/dashboard' do
    @name = params[:username]
    erb :dashboard
    end

  get "/events" do

    DB[username] ||= []
    body json DB[username].map { |e| e.to_hash }
  end

  get '/add_events' do
    erb :add_events
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

    body = request.body.read
    begin
      new_item = JSON.parse body
    rescue
      status 400
      halt "Can't parse json: '#{body}'"
    end

    event = create_event new_item
    new_call = weather_api_data event.zipcode
    new_call.parse!


    comparison = comparison event, new_call
    forecast = comparison.match?
    event.forecast = forecast
#
    DB[username] ||= []
    DB[username].push event

f = File.open("userdata.json", "w")
f.puts "#{DB.to_json }"

f.close
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
