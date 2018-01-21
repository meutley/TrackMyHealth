class WeightAnalyticsViewmodel
    attr_accessor :unit, :min, :max, :average, :weight_measurements

    def initialize
        @weight_measurements = Array.new
    end
end