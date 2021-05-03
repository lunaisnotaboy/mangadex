require 'test_helper'

class RulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rules_index_url
    assert_response :success
  end

end
