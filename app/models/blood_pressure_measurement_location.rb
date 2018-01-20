class BloodPressureMeasurementLocation < ApplicationRecord
    has_many :blood_pressure_measurements, :foreign_key => 'blood_pressure_measurement_location_id'
end
