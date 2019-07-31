require 'test_helper'

class SpansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spans_new_url
    assert_response :success
  end

end
