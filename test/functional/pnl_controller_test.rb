require 'test_helper'

class PnlControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_response :success
  end
end
