class WeightMeasurement < ApplicationRecord
  has_one :user
  
  scope :most_recent_for_user, ->(user_id) { where(user_id: user_id).order(taken_at: :desc) }

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :value, presence: true, numericality: true
  validates :taken_at, presence: true
end
