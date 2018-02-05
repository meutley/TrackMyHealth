class BloodGlucoseController < ApplicationController
  # GET /
  def index
    @measurements = BloodGlucoseMeasurement.where(user_id: current_user.id).order(taken_at: :desc)

    @total_count = @measurements.count
    @number_of_pages = ((@total_count + PAGE_SIZE - 1) / PAGE_SIZE).clamp(1, 99999)
    @current_page = (params[:page].to_i || 1).clamp(1, @number_of_pages)
    @first_record_index = ((@current_page - 1) * PAGE_SIZE) + 1
    @last_record_index = (@first_record_index + PAGE_SIZE - 1).clamp(0, @total_count)

    @measurements = @measurements.offset(PAGE_SIZE * (@current_page - 1)).take(PAGE_SIZE)
  end

  # GET /new
  # POST /new
  def new
    @measurement = BloodGlucoseMeasurement.new

    if request.post?
      @measurement = current_user.blood_glucose_measurements.new(blood_glucose_measurement_params)
      @measurement.taken_at = convert_date_time_format(params[:blood_glucose_measurement][:taken_at])
      if @measurement.save
        flash[:message] = "The blood glucose measurement was created successfully."
        redirect_to blood_glucose_path
      else
        render :new
      end
    end
  end

  # GET /edit/:id
  # PATCH /edit/:id
  def edit
    @measurement = current_user.blood_glucose_measurements.find(params[:id])

    if request.patch?
      @measurement.assign_attributes(blood_glucose_measurement_params)
      @measurement.taken_at = convert_date_time_format(params[:blood_glucose_measurement][:taken_at])
      if @measurement.save
        flash[:message] = "The blood glucose measurement was saved successfully."
        redirect_to blood_glucose_path
      else
        render :edit
      end
    end
  end

  # POST /delete/:id
  def delete
    current_user.blood_glucose_measurements.destroy(params[:id])
    flash[:message] = "The blood glucose measurement was deleted successfully."
    redirect_to blood_glucose_path
  end

  private
    def blood_glucose_measurement_params
      params
        .require(:blood_glucose_measurement)
        .permit(
          :value,
          :notes,
          :taken_at)
    end
end
