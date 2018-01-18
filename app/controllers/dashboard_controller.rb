class DashboardController < ApplicationController
  include DashboardHelper
  
  before_action :authenticate_user!
  
  def index
    blood_pressure = BloodPressureMeasurement.where(user_id: current_user.id).order(created_at: :desc).first
    @model = DashboardViewModel.new(blood_pressure, nil, nil)

    @module_rows = get_ordered_module_rows(DashboardModule.active_for_user(current_user.id).reverse).sort_by {|m| m.length}
    @module_rows.reverse!
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
end
