require 'test_helper'

class AdminClassSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_class_sessions_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_class_sessions_show_url
    assert_response :success
  end

end
