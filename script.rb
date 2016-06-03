require 'httparty'
require 'pry'

#Wunderground key: 5da109d8183e7ad8


 HTTParty.post "http://localhost:4567/events",
 body: '{"title": "Meeting", "description": "Strategy planning", "date": "05-06-2016", "zip_code": "27529" }',
 headers: { "Authorization" => "user" }

 r = HTTParty.get "http://localhost:4567/events",
 headers: { "Authorization" => "user" }

 binding.pry