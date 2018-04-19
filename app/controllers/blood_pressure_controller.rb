class BloodPressureController < ApplicationController
  include Comparable
  
  before_action :authenticate_user!
  
  def index
    @measurements = current_user.blood_pressure_measurements
      .joins(:blood_pressure_measurement_position, :blood_pressure_measurement_location)
      .includes(:blood_pressure_measurement_position, :blood_pressure_measurement_location)
      .order(taken_at: :desc)

    @total_count = @measurements.count
    @number_of_pages = ((@total_count + PAGE_SIZE - 1) / PAGE_SIZE).clamp(1, 99999)
    @current_page = (params[:page].to_i || 1).clamp(1, @number_of_pages)
    @first_record_index = ((@current_page - 1) * PAGE_SIZE) + 1
    @last_record_index = (@first_record_index + PAGE_SIZE - 1).clamp(0, @total_count)

    @measurements = @measurements.offset(PAGE_SIZE * (@current_page - 1)).take(PAGE_SIZE)
  end

  def new
    @measurement = BloodPressureMeasurement.new
    @positions = BloodPressureMeasurementPosition.all.order(:name)
    @locations = BloodPressureMeasurementLocation.all.order(:name)
    
    if request.post?
      @measurement = current_user.blood_pressure_measurements.new(blood_pressure_measurement_params)
      @measurement.taken_at = convert_date_time_format(params[:blood_pressure_measurement][:taken_at])
      if @measurement.save
        flash[:message] = "The blood pressure measurement was created successfully."
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
      @measurement.taken_at = convert_date_time_format(params[:blood_pressure_measurement][:taken_at])
      if @measurement.save
        flash[:message] = "The blood pressure measurement was saved successfully."
        redirect_to blood_pressure_path
      else
        render :edit
      end
    end
  end

  def delete
    current_user.blood_pressure_measurements.destroy(params[:id])
    flash[:message] = "The blood pressure measurement was deleted successfully."
    redirect_to blood_pressure_path
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
          :notes,
          :taken_at)
    end
end
