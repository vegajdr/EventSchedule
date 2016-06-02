require 'httparty'
require 'pry'


 HTTParty.post "http://localhost:4567/events",
 body: '{"title": "Meeting", "description": "Strategy planning", "date": "05-06-2016" }',
 headers: { "Authorization" => "user" }

 r = HTTParty.get "http://localhost:4567/events",
 headers: { "Authorization" => "user" }

 binding.pry 
