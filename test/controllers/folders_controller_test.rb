require 'test_helper'

class FoldersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get folders_new_url
    assert_response :success
  end

end
