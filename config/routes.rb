Rails.application.routes.draw do
  root to: "sessions#new"

  get '/ambassadors', to: 'users#ambassadors'
  get '/vendors', to: 'users#vendors'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :roles, only: [:new, :create]

  resources :privacy, only: [:edit, :update]
  
  resources :vendors do
    resources :reviews
  end

  resources :locations, only: [:index]
  get 'locations/all', to: 'locations#all'

  namespace :admin do
    resources :users
  end


  get '', to: 'sessions#new'

end
