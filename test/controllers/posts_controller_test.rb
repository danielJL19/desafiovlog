require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "should get show" do
    get posts_show_url(@post)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get posts_edit_url(@post)
    assert_response :success
  end
end
