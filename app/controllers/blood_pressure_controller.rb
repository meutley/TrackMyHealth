class BloodPressureController < ApplicationController
  def index
    @measurements = BloodPressureService.get
  end

  def new
    if request.post?
      systolic = params[:systolic]
      diastolic = params[:diastolic]
      pulse = params[:pulse]
      notes = params[:notes]
      
      @measurement = BloodPressureService.create(1, 1, systolic, diastolic, pulse, notes)
      if !@measurement.valid?    # @measurement.save
        redirect_to blood_pressure_index_path
      else
        render :new
      end
    end
  end
end
