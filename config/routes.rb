Rails.application.routes.draw do
  devise_for :users, path: 'users',
    controllers: { registrations: 'users/registrations' },
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  
  get 'home/index'
  get 'home/about'
  
  get 'blood_pressure', to: 'blood_pressure#index'
  get 'blood_pressure/index'
  get 'blood_pressure/new'
  post 'blood_pressure/new'

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/index'

  devise_scope :user do
    get 'users/profile' => 'users/registrations#profile'
    post 'users/profile' => 'users/registrations#profile'
  end

  authenticated :user do
    root :to => 'dashboard#index', as: :authenticated_root
  end
  root 'home#index'
end
