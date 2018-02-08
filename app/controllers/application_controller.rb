class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

  around_action :set_time_zone, if: :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  PAGE_SIZE = 25

  protected
    def convert_date_time_format(value)
      return Time.zone.strptime(value, "%m/%d/%Y %I:%M %p") unless (Time.strptime(value, "%m/%d/%Y %I:%M %p") rescue ArgumentError) == ArgumentError
    end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :timezone, :weight_unit, :blood_glucose_unit) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :timezone, :weight_unit, :blood_glucose_unit) }
    end

    def set_time_zone(&block)
      Time.use_zone(current_user.timezone, &block)
    end
end
