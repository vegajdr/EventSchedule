require 'pry'
require 'minitest/autorun'
require 'minitest/focus'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'rack/test'

require "./app"

class EventAppBase < Minitest::Test
  include Rack::Test::Methods

  def app
    EventApp
  end

  def setup
    EventApp::DB.clear
  end
end

class NotLoggedIn < EventAppBase
  def test_login_is_required
    response = get "/events"
    assert_equal 401, response.status

    body = JSON.parse response.body
    assert_equal "You must log in", body["error"]
  end
#
#   def test_user_lists_are_separate
#     header "Authorization", "jdabbs"
#     post "/list", '{"title": "groceries"}'
#
#     header "Authorization", "daniel"
#     post "/list", '{"title": "learn ruby"}'
#
#     header "Authorization", "jdabbs"
#     response = get "/list"
#
#     body = JSON.parse response.body
#
#     assert_equal 1, body.count
#     assert_equal "groceries", body.first["title"]
#   end
# end
#
class LoggedIn < EventAppBase
  def setup
    super
    header "Authorization", "user"
  end
#
  def test_starts_with_empty_list
    response = get "/events"

    assert_equal 200, response.status
    assert_equal "[]", response.body
  end
#
  def test_can_add_events
    post "/events", '{"title": "Meeting", "description": "Strategy planning", "date": "05-06-2016" }'

    response = get "/events"

    assert_equal 200, response.status
    list = JSON.parse response.body
    assert_equal 1, list.count
    assert_equal "Meeting", list.first["title"]

  end

  def test_can_add_events_with_only_title

    post "/events", '{"title": "Meeting" }'
    response = get "/events"
    assert_equal 200, response.status
    list = JSON.parse response.body
    assert_equal 1, list.count
    assert_equal "Meeting", list.first["title"]

  end
#
#   def test_add_response
#     response = post "/list", '{"title": "do things"}'
#     assert_equal 200, response.status
#     assert_equal "ok", response.body
#   end
#
#   def test_requires_title
#     response = post "/list", '{}'
#     assert_equal 422, response.status
#     assert_equal "No title", response.body
#   end
#
#   def test_handles_bad_json
#     response = post "/list", 'not json'
#     assert_equal 400, response.status
#     assert_equal "Can't parse json: 'not json'", response.body
#   end
#
#   def test_can_mark_items_complete
#     post "/list", '{"title": "groceries"}'
#     post "/list", '{"title": "learn ruby"}'
#
#     response = patch "/list", title: "learn ruby"
#     assert_equal 200, response.status
#
#     response = get "/list"
#     json = JSON.parse response.body
#     assert_equal 1, json.count
  end
end
