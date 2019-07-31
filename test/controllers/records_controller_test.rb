require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get records_new_url
    assert_response :success
  end

end
