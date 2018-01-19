class WeightController < ApplicationController
  def index
  end

  def new
    @measurement = WeightMeasurement.new

    if request.post?
      @measurement = current_user.weight_measurements.new(weight_measurement_params)
      if @measurement.save
        redirect_to weight_path
      else
        render :new
      end
    end
  end

  private
    def weight_measurement_params
      params
        .require(:weight_measurement)
        .permit(
          :value,
          :notes)
    end
end
