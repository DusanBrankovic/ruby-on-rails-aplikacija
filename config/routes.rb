Rails.application.routes.draw do
  
  root "home#index", as: :root

  get 'login', to: 'sessions#new', as: :login
  get 'register', to: 'users#new', as: :register

  resources :users
  resources :sessions
  resources :user_types
  resources :workout_types
  resources :equipment_types
  resources :equipment
  resources :workouts
  resources :exercises
end
