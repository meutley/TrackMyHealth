require 'test_helper'

class BloodPressureServiceTest < ActiveSupport::TestCase
  test "create returns valid model" do
    result = BloodPressureService.create(1, 1, 120, 80, 75)
    assert result != nil
    assert result.blood_pressure_measurement_position_id == 1
    assert result.blood_pressure_measurement_location_id == 1
    assert result.systolic == 120
    assert result.diastolic == 80
    assert result.pulse == 75
    assert result.valid?
  end

  test "create returns invalid model" do
    result = BloodPressureService.create(1, 1, nil, nil)
    assert result != nil
    assert result.valid? == false
  end
end
