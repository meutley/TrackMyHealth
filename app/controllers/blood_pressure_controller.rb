class BloodPressureController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @measurements = BloodPressureService.get(current_user.id)
  end

  def new
    if request.post?
      user_id = current_user.id
      systolic = params[:systolic]
      diastolic = params[:diastolic]
      pulse = params[:pulse]
      notes = params[:notes]
      
      @measurement = BloodPressureService.create(user_id, 1, 1, systolic, diastolic, pulse, notes)
      if !@measurement.valid?    # @measurement.save
        redirect_to blood_pressure_index_path
      else
        render :new
      end
    end
  end
end
