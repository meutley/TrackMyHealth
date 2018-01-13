class BloodPressureMeasurement < ApplicationRecord
    has_one :blood_pressure_measurement_position
    has_one :blood_pressure_measurement_location

    validates :blood_pressure_measurement_position_id, numericality: { only_integer: true }
    validates :blood_pressure_measurement_location_id, numericality: { only_integer: true }
    validates :systolic, presence: true, numericality: { only_integer: true }
    validates :diastolic, presence: true, numericality: { only_integer: true }
    validates :pulse, numericality: { only_integer: true }, allow_nil: true
end
