require 'test_helper'

class LegalControllerTest < ActionController::TestCase
  test "should get terms" do
    get :terms
    assert_response :success
  end

end
