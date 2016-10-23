Rails.application.routes.draw do
  root to: 'pages#splash'

  get 'ui(/:action)', controller: 'ui' unless Rails.env.production?

  ### Sessions ###
  get 'login', to: 'sessions#new'
  post 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  ### Users ###
  get 'home', to: 'users#home'
  get 'register', to: 'users#new'
  resources :users, only: [:create, :edit, :update] do 
    resources :messages, only: [:create]
    resources :dispensers, only: [:new, :create, :edit, :update]
    resources :sprinkles_messengers, only: [:show, :update]
  end
end

