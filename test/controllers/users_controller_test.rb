require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get inquiry" do
    get users_inquiry_url
    assert_response :success
  end
end
