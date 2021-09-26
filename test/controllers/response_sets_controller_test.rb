require 'test_helper'

class ResponseSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get response_sets_index_url
    assert_response :success
  end

  test "should get edit" do
    get response_sets_edit_url
    assert_response :success
  end

  test "should get update" do
    get response_sets_update_url
    assert_response :success
  end

end
