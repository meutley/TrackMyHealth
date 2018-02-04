class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blood_pressure_measurements
  has_many :blood_glucose_measurements
  has_many :weight_measurements

  has_many :user_active_dashboard_modules
  has_many :dashboard_modules, through: :user_active_dashboard_modules

  validates :timezone, presence: true
  validates :weight_unit, presence: true
  validates :blood_glucose_unit, presence: true
end
