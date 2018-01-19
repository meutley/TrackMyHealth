class BloodPressureMeasurement < ApplicationRecord
    has_one :blood_pressure_measurement_position
    has_one :blood_pressure_measurement_location
    has_one :user
    
    scope :most_recent_for_user, ->(user_id) { where(user_id: user_id).order(created_at: :desc) }

    validates :user_id, presence: true, numericality: { only_integer: true }
    validates :blood_pressure_measurement_position_id, numericality: { only_integer: true }
    validates :blood_pressure_measurement_location_id, numericality: { only_integer: true }
    validates :systolic, presence: true, numericality: { only_integer: true }
    validates :diastolic, presence: true, numericality: { only_integer: true }
    validates :pulse, numericality: { only_integer: true }, allow_nil: true
end
