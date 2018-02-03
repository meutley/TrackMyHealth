module ApplicationHelper
    def to_user_timezone_formatted(value)
        tz = current_user&.timezone
        return value&.in_time_zone(tz)&.strftime("%-m/%-d/%Y %I:%M %p") if !tz.nil?
    end

    # Static data
    def weight_units
        return ["lbs", "kg"]
    end

    def blood_glucose_units
        return ["mg/dL", "mmol/L"]
    end
end
