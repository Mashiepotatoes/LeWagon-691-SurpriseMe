require 'test_helper'

class RatingControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rating_new_url
    assert_response :success
  end

  test "should get create" do
    get rating_create_url
    assert_response :success
  end

end
