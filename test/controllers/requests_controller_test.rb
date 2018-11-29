require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get requests_create_url
    assert_response :success
  end

  test "should get destroy" do
    get requests_destroy_url
    assert_response :success
  end

end
