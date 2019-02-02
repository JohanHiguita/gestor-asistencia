require 'test_helper'

class FacilitadorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facilitadors_index_url
    assert_response :success
  end

  test "should get show" do
    get facilitadors_show_url
    assert_response :success
  end

  test "should get destroy" do
    get facilitadors_destroy_url
    assert_response :success
  end

end
