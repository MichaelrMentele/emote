Rails.application.routes.draw do
  root to: 'pages#splash'

  get 'ui(/:action)', controller: 'ui' unless Rails.env.production?

  get 'login', to: 'sessions#new'
  post 'logout', to: 'sessions#destroy'

  get 'register', to: 'users#new'
  resources :users, only: [:create, :edit]
end
