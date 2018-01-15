class BloodPressureController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @measurements = BloodPressureService.get(current_user.id)
  end

  def new
    @positions = BloodPressureMeasurementPosition.all.order(:name)
    @locations = BloodPressureMeasurementLocation.all.order(:name)
    
    if request.post?
      user_id = current_user.id
      
      @measurement = BloodPressureService.create(user_id, params[:blood_pressure_measurement])
      if @measurement.save
        redirect_to blood_pressure_index_path
      else
        render :new
      end
    else
      @measurement = BloodPressureMeasurement.new
    end
  end
end
