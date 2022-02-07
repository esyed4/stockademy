require "test_helper"

class RootControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_index_url
    assert_response :success
  end

  test "should get home" do
    get root_home_url
    assert_response :success
  end
end
