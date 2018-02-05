class WeightController < ApplicationController
  # GET /
  def index
    @measurements = WeightMeasurement.where(user_id: current_user.id).order(taken_at: :desc)

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
    @measurement = WeightMeasurement.new

    if request.post?
      @measurement = current_user.weight_measurements.new(weight_measurement_params)
      @measurement.taken_at = convert_date_time_format(params[:weight_measurement][:taken_at])
      if @measurement.save
        flash[:message] = "The weight measurement was created successfully."
        redirect_to weight_path
      else
        render :new
      end
    end
  end

  # GET /edit/:id
  # PATCH /edit/:id
  def edit
    @measurement = current_user.weight_measurements.find(params[:id])

    if request.patch?
      @measurement.assign_attributes(weight_measurement_params)
      @measurement.taken_at = convert_date_time_format(params[:weight_measurement][:taken_at])
      if @measurement.save
        flash[:message] = "The weight measurement was saved successfully."
        redirect_to weight_path
      else
        render :edit
      end
    end
  end

  # POST /delete/:id
  def delete
    current_user.weight_measurements.destroy(params[:id])
    flash[:message] = "The weight measurement was deleted successfully."
    redirect_to weight_path
  end

  private
    def weight_measurement_params
      params
        .require(:weight_measurement)
        .permit(
          :value,
          :notes,
          :taken_at)
    end
end
