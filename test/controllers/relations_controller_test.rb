require "test_helper"

class RelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get relations_followings_url
    assert_response :success
  end

  test "should get followers" do
    get relations_followers_url
    assert_response :success
  end
end
