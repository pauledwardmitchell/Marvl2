Rails.application.routes.draw do
  root to: "sessions#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create]
  
  resources :vendors do
    resources :reviews
  end

  resources :locations, only [:index]
  get 'locations/all', to: 'locations#all'

  namespace :admin do
    resources :users
  end

  resources :users

  get '', to: 'sessions#new'

end
