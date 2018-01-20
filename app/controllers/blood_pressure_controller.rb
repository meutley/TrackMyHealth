class BloodPressureController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @measurements = current_user.blood_pressure_measurements
      .joins(:blood_pressure_measurement_position, :blood_pressure_measurement_location)
      .includes(:blood_pressure_measurement_position, :blood_pressure_measurement_location)
      .order(created_at: :desc)
  end

  def new
    @measurement = BloodPressureMeasurement.new
    @positions = BloodPressureMeasurementPosition.all.order(:name)
    @locations = BloodPressureMeasurementLocation.all.order(:name)
    
    if request.post?
      @measurement = current_user.blood_pressure_measurements.new(blood_pressure_measurement_params)
      if @measurement.save
        redirect_to blood_pressure_path
      else
        render :new
      end
    end
  end

  def edit
    @measurement = current_user.blood_pressure_measurements.find(params[:id])
    @positions = BloodPressureMeasurementPosition.all.order(:name)
    @locations = BloodPressureMeasurementLocation.all.order(:name)

    if request.patch?
      @measurement.assign_attributes(blood_pressure_measurement_params)
      if @measurement.save
        redirect_to blood_pressure_path
      else
        render :edit
      end
    end
  end

  private
    def blood_pressure_measurement_params
      params
        .require(:blood_pressure_measurement)
        .permit(
          :blood_pressure_measurement_position_id,
          :blood_pressure_measurement_location_id,
          :systolic,
          :diastolic,
          :pulse,
          :notes)
    end
end
