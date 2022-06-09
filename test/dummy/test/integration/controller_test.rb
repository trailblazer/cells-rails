require "test_helper"

class ControllerTest < ActionController::TestCase
  tests SongsController

  it do
    get :index
    _(response.body).must_equal "happy"
  end

  # HTML escaping.
  it do
    get :with_escaped
    _(response.body).must_equal "<h1>Yeah!</h1><b>&lt;script&gt;</b>" # only the property is escaped.
  end
end