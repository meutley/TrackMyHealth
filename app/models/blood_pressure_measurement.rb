class BloodPressureMeasurement < ApplicationRecord
    has_one :blood_pressure_measurement_position
    has_one :blood_pressure_measurement_location
end
