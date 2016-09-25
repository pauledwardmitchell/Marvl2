Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'

  resources :members
  resources :users, only: [:show, :new, :create]
  

  get 'locations/all', to: 'locations#all'
  resources :locations
end
