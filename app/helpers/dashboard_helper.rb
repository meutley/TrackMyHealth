module DashboardHelper
    def blood_pressure_display(blood_pressure_measurement)
        return "#{blood_pressure_measurement.systolic}/#{blood_pressure_measurement.diastolic}"
    end

    def card_header_link(link_path, id)
        link = link_path
        if !id.nil?
            link = "#{link}/#{id}"
        end
        
        return link
    end
end
