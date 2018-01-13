class BloodPressureService
    def self.create(position_id, location_id, systolic, diastolic, pulse = nil, notes = nil)
        return BloodPressureMeasurement.create(
            blood_pressure_measurement_position_id: position_id,
            blood_pressure_measurement_location_id: location_id,
            systolic: systolic,
            diastolic: diastolic,
            pulse: pulse,
            notes: notes)
    end
end