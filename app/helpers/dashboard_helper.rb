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
    
    def card_classes(new_link, is_placeholder)
        out = ""
        out = " show-new-link" unless !defined?(new_link) || new_link.nil?
        out += " placeholder" unless !defined?(is_placeholder) || is_placeholder == false
        return out
    end
    
    def card_data_attributes(new_link)
        out = " data-new-link=#{new_link}" unless !defined?(new_link) || new_link.nil?
        return out
    end

    def get_ordered_module_rows(modules)
        result = Array.new
        return result if modules.nil? || modules.length == 0

        modules_row = Array.new
        i = 0
        while i < modules.length
            modules_row.push(modules[i])
            i += 1
            
            if (i >= modules.length || i % NUMBER_OF_CARDS_PER_ROW == 0)
                result.push(modules_row.reverse)
                modules_row = Array.new
            end
        end

        return result
    end
    
    def render_dashboard_module_card(dashboard_module, model)
        html_out = '<div class="card dashboard-card text-center">'
        
        case dashboard_module&.name
        when "Blood Pressure"
            html_out += render partial: "dashboard/blood_pressure_card", locals: { model: model }
        when "Weight"
            html_out += render partial: "dashboard/weight_card", locals: { model: model }
        else
            html_out += render partial: "dashboard/placeholder_card", locals: { title: "(Placeholder)" }
        end
        
        html_out += '</div>'
        
        return html_out.html_safe
    end
    
    def render_remaining_placeholder_cards(i)
        html_out = ''
        (3 - (i + 1)).times do
            html_out += render_dashboard_module_card(nil, nil)
        end
        
        return html_out.html_safe
    end
    
    def needs_placeholders(i, modules_count)
        return (i + 1) % 3 != 0 && i == modules_count - 1
    end
end
