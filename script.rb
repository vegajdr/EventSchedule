require 'httparty'
require 'pry'

#Wunderground key: 5da109d8183e7ad8


 p = HTTParty.post "http://localhost:4567/events",
 body: '{"title": "Day off", "description": "Just trying to stay sane", "month": 6, "day": 7, "year": 2016, "zipcode": "27530" }',
 headers: { "Authorization" => "user" }

 a = HTTParty.get "http://localhost:4567/events",
 headers: { "Authorization" => "user" }


 r = HTTParty.get "http://localhost:4567/events/6/7/2016",
 headers: { "Authorization" => "user" }


 # p = HTTParty.post "http://tiyeventapi.herokuapp.com/events",
 # body: '{"title": "Meeting", "description": "Strategy planning", "month": 6, "day": 7, "year": 2016, "zip_code": "27529" }',
 # headers: { "Authorization" => "user" }
 #
 # a = HTTParty.get "http://tiyeventapi.herokuapp.com/events",
 # headers: { "Authorization" => "user" }
 #
 #
 # r = HTTParty.get "http://tiyeventapi.herokuapp.com/events/6/7/2016",
 # headers: { "Authorization" => "user" }

 binding.pry
