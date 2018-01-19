require 'test_helper'

class WeightControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weight_index_url
    assert_response :success
  end

  test "should get new" do
    get weight_new_url
    assert_response :success
  end

end
