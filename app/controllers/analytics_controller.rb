class AnalyticsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def blood_pressure
  end

  def weight
  end

  # GET /analytics/blood_pressure/trends
  def blood_pressure_data
    @measurements = current_user.blood_pressure_measurements.order(taken_at: :desc).limit(10)
    results = Array.new
    @measurements.each do |m|
      results.push(
        BloodPressureAnalyticsViewmodel.new(
          m.systolic,
          m.diastolic,
          m.taken_at.in_time_zone(current_user.timezone).strftime("%-m/%-d/%Y %I:%M %p")))
    end

    respond_to do |format|
      format.json { render :json => { :blood_pressure_measurements => results } }
    end
  end

  # GET /analytics/weight/trends
  def weight_data
    @weights = current_user.weight_measurements.order(created_at: :desc).limit(10)

    if @weights.length > 0
      model = WeightAnalyticsViewmodel.new
      model.unit = current_user.weight_unit
      model.min = @weights.minimum(:value)
      model.max = @weights.maximum(:value)
      model.average = @weights.average(:value).round(1)

      @weights.each do |w|
        model.weight_measurements.push(
          WeightAnalyticsMeasurementViewmodel.new(
            w.value,
            w.created_at.in_time_zone(current_user.timezone).strftime("%-m/%-d/%Y %I:%M %p")))
      end
    end

    respond_to do |format|
      format.json { render :json => { :model => model } }
    end
  end
end
