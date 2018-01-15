# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  # GET users/profile
  # POST users/profile
  def profile
    
  end
end
