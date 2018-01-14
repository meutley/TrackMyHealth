class BloodPressureService
    def self.get(user_id)
        return BloodPressureMeasurement.where(user_id: user_id)
    end
    
    def self.create(user_id, position_id, location_id, systolic, diastolic, pulse = nil, notes = nil)
        return BloodPressureMeasurement.create(
            user_id: user_id,
            blood_pressure_measurement_position_id: position_id,
            blood_pressure_measurement_location_id: location_id,
            systolic: systolic,
            diastolic: diastolic,
            pulse: pulse,
            notes: notes)
    end
end