class DashboardViewModel
    attr_reader :blood_pressure, :weight
    
    def initialize(blood_pressure, weight)
        @blood_pressure = blood_pressure
        @weight = weight
    end
end