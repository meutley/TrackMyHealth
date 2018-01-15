class BloodPressureController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @measurements = BloodPressureMeasurement.where(user_id: current_user.id)
  end

  def new
    @positions = BloodPressureMeasurementPosition.all.order(:name)
    @locations = BloodPressureMeasurementLocation.all.order(:name)
    
    if request.post?
      model = params[:blood_pressure_measurement]
      @measurement = BloodPressureMeasurement.new(
        user_id: current_user.id,
        blood_pressure_measurement_position_id: model[:blood_pressure_measurement_position_id],
        blood_pressure_measurement_location_id: model[:blood_pressure_measurement_location_id],
        systolic: model[:systolic],
        diastolic: model[:diastolic],
        pulse: model[:pulse],
        notes: model[:notes])

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
