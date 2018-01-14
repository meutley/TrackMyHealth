Rails.application.routes.draw do
  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  
  get 'blood_pressure', to: 'blood_pressure#index'
  get 'blood_pressure/index'
  get 'blood_pressure/new'
  post 'blood_pressure/new'
  post 'blood_pressure/create'

  get 'home/index'
  get 'home/about'

  root 'home#index'
end
