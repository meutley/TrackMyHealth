class DashboardViewModel
    attr_reader :blood_pressure, :blood_glucose, :weight
    
    def initialize(blood_pressure, blood_glucose, weight)
        @blood_pressure = blood_pressure
        @blood_glucose = blood_glucose
        @weight = weight
    end
end