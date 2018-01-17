class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    blood_pressure = BloodPressureMeasurement.where(user_id: current_user.id).order(created_at: :desc).first
    @model = DashboardViewModel.new(blood_pressure, nil, nil)
  end

  def customize
    puts params
  end
end
