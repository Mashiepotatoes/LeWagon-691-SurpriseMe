require 'test_helper'

class GiftRecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gift_recommendations_index_url
    assert_response :success
  end

end
