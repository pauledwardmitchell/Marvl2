Rails.application.routes.draw do

 
  root to: "sessions#index"


  devise_for :users
  authenticated :user do
    root to: 'vendors#index'
  end

  # root to: "sessions#index"


  get '/ambassadors', to: 'users#ambassadors'
  get '/samplevendors', to: 'users#samplevendors', as: :samplevendors
  post '/admin', to: 'roles#admin'
  post '/member', to: 'roles#member'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'
  get '/forum', to: 'posts#forum'
  get '/reviews', to: 'reviews#index'
  get '/documents/:id/download', to: 'documents#download', as: :download
  get '/editpassword', to: 'users#edit_password'
  post '/patchpassword', to: 'users#patch_password'

  resources :users 

  resources :documents, only: [:new, :create, :index, :show, :destroy]

  resources :roles, only: [:new, :create]

  resources :posts, only: [:new, :create, :edit, :update, :destroy]

  resources :privacy, only: [:edit, :update]

  resources :organisations, only: [:new, :create, :edit, :update]

  resources :password_resets

  resources :vendors do
    resources :reviews do
      resources :votes
    end
    resources :offerings
  end

  # resources :reviews do
  #   resources :votes
  # end

  resources :categories, only: [:index, :show, :new, :create]

  get 'locations/all', to: 'locations#all'
  resources :locations, only: [:index, :show, :all, :new, :create, :edit, :update]

  namespace :admin do
    resources :vendors
    resources :users do
      resources :roles
    end
  end

end
