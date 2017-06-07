require 'test_helper'

class Blog::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_welcome_index_url
    assert_response :success
  end

end
