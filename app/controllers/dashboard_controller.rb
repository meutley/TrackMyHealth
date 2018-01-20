class DashboardController < ApplicationController
  before_action :authenticate_user!

  NUMBER_OF_CARDS_PER_ROW = 3
  
  def index
    @model = DashboardViewModel.new(
      BloodPressureMeasurement.most_recent_for_user(current_user.id).first,
      WeightMeasurement.most_recent_for_user(current_user.id).first)

    @module_rows = get_ordered_module_rows(DashboardModule.active_for_user(current_user.id).reverse)
    @module_rows.sort_by {|m| m.length}.reverse!
  end

  def customize
    @available_modules = DashboardModule.available_for_user(current_user.id)
    @active_modules = DashboardModule.active_for_user(current_user.id)

    if request.post?
      UserActiveDashboardModule.transaction do
        UserActiveDashboardModule.where(user_id: current_user.id).destroy_all

        modules = params[:activeModules]
        if modules != nil
          @save_modules = Array.new
          modules.each_with_index do |m,index|
            current_user.user_active_dashboard_modules.create(:dashboard_module_id => m.to_i, :sort_order => index + 1)
          end
        end

        respond_to do |format|
          format.json { render :json => { :message => "Dashboard customization was saved successfully" } }
        end
      end
    end
  end

  private
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
end
