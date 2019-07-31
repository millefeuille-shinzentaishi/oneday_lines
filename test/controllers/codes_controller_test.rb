require 'test_helper'

class CodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get codes_new_url
    assert_response :success
  end

end
