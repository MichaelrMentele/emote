Rails.application.routes.draw do
  root to: 'pages#splash'

  get 'ui(/:action)', controller: 'ui' unless Rails.env.production?

  resources :users, only: [:new, :create, :edit]
end
