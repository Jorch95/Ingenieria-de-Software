require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  test "should get solicitar" do
    get :solicitar
    assert_response :success
  end

end
