class WeightMeasurement < ApplicationRecord
    has_one :user
    
    validates :user_id, presence: true, numericality: { only_integer: true }
    validates :value, presence: true, numericality: true
end
