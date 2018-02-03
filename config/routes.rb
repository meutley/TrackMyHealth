Rails.application.routes.draw do
  devise_for :users, path: 'users',
    controllers: { registrations: 'users/registrations' },
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  
  get 'home/index'
  get 'home/about'
  
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/index'
  get 'dashboard/customize'
  post 'dashboard/customize'
  
  get 'blood_pressure', to: 'blood_pressure#index'
  get 'blood_pressure/index'
  get 'blood_pressure/new'
  post 'blood_pressure/new'
  get 'blood_pressure/edit/:id', to: 'blood_pressure#edit', :as => :blood_pressure_edit
  patch 'blood_pressure/edit/:id', to: 'blood_pressure#edit'
  post 'blood_pressure/delete/:id', to: 'blood_pressure#delete', :as => :blood_pressure_delete
  
  get 'weight', to: 'weight#index'
  get 'weight/new'
  post 'weight/new'
  get 'weight/edit/:id', to: 'weight#edit', :as => :weight_edit
  patch 'weight/edit/:id', to: 'weight#edit'
  post 'weight/delete/:id', to: 'weight#delete', :as => :weight_delete

  get 'analytics', to: 'analytics#index'
  get 'analytics/index'
  get 'analytics/blood_pressure'
  get 'analytics/weight'

  # Analytics API
  get 'analytics/blood_pressure_data'
  get 'analytics/weight_data'

  authenticated :user do
    root :to => 'dashboard#index', as: :authenticated_root
  end
  root 'home#index'
end
