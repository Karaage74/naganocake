require "test_helper"

class Admin::CustormersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_custormers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_custormers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_custormers_edit_url
    assert_response :success
  end
end
