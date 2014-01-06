require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test "should get personal_info" do
    get :personal_info
    assert_response :success
  end

end
