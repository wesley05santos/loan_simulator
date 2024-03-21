require "test_helper"

class LoansRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loans_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get loans_requests_show_url
    assert_response :success
  end
end
