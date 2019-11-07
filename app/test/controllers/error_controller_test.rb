require 'test_helper'

class ErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get 404" do
    get error_404_url
    assert_response :success
  end

  test "should get 422" do
    get error_422_url
    assert_response :success
  end

  test "should get 500" do
    get error_500_url
    assert_response :success
  end

  test "should get 503" do
    get error_503_url
    assert_response :success
  end

end
