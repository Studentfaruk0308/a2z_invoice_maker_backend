Rails.application.routes.draw do
  
  root to: 'application#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  match '/auth/:provider/callback', to: 'sessions#omniauth', via: [:get, :post]
  
  resources :users  
  resources :invoices
  resources :profiles
  resources :clients

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
