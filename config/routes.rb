Rails.application.routes.draw do
  get 'blood_pressure/index'
  get 'blood_pressure/new'
  post 'blood_pressure/new'
  post 'blood_pressure/create'

  get 'home/index'
  get 'home/about'

  root 'home#index'
end
