module DashboardHelper
    def blood_pressure_display(blood_pressure_measurement)
        return "#{blood_pressure_measurement.systolic} / #{blood_pressure_measurement.diastolic}"
    end
end
