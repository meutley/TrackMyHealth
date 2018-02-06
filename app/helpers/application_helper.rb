module ApplicationHelper
    class ::Fixnum
        def self.clamp(min, max)
            return min if self < min
            return max if self > max
            return self
        end
    end
    
    def to_user_timezone_formatted(value)
        tz = current_user&.timezone
        return value&.in_time_zone(tz)&.strftime("%-m/%-d/%Y %I:%M %p")
    end

    # Static data
    def weight_units
        return ["lbs", "kg"]
    end

    def blood_glucose_units
        return ["mg/dL", "mmol/L"]
    end
end
