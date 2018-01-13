require 'test_helper'

class BloodPressureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blood_pressure_index_url
    assert_response :success
  end

end
