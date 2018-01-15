class BloodPressureService
    def self.get(user_id)
        return BloodPressureMeasurement.where(user_id: user_id).order(created_at: :desc)
    end
    
    def self.create(user_id, params)
        return BloodPressureMeasurement.create(
            user_id: user_id,
            blood_pressure_measurement_position_id: params[:blood_pressure_measurement_position_id].to_i,
            blood_pressure_measurement_location_id: params[:blood_pressure_measurement_location_id].to_i,
            systolic: params[:systolic],
            diastolic: params[:diastolic],
            pulse: params[:pulse],
            notes: params[:notes])
    end
end