module DashboardHelper
    NUMBER_OF_CARDS_PER_ROW = 3
    
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

    def get_ordered_module_rows(modules)
        result = Array.new
        return result if modules.nil? || modules.length == 0

        modules_row = Array.new
        i = 0
        while i < modules.length
            modules_row.push(modules[i])
            
            if (i >= modules.length || i % NUMBER_OF_CARDS_PER_ROW == 0)
                result.push(modules_row.reverse)
                modules_row = Array.new
            end
            
            i += 1
        end

        return result
    end
end
