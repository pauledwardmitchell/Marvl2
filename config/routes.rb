Rails.application.routes.draw do

	get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members

  resources :users, only: [:show, :new, :create]

end
