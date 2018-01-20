require 'test_helper'

class AnalyticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get analytics_index_url
    assert_response :success
  end

  test "should get blood_pressure" do
    get analytics_blood_pressure_url
    assert_response :success
  end

  test "should get weight" do
    get analytics_weight_url
    assert_response :success
  end

end
