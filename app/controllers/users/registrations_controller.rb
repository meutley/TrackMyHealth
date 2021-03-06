# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  protected
    def after_sign_up_path_for(resource)
      dashboard_customize_path
    end
end
