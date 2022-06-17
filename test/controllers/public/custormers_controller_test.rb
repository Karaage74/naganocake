require "test_helper"

class Public::CustormersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_custormers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_custormers_edit_url
    assert_response :success
  end
end
