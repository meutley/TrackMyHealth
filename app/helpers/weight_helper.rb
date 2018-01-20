module WeightHelper
    def calculate_average_weight(measurements)
        unless measurements.nil? || measurements.length == 0
            sum = 0
            measurements.each{ |m| sum += m.value.to_f }
            return (sum / measurements.length).round(1)
        else
            return "N/A"
        end
    end
end
