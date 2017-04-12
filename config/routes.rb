Rails.application.routes.draw do

  # namespace :admin do
  #   resources :users
  #   root to: "devise/sessions#new"
  # end

  # root to: 'vendors#index'

  # devise_for :users
  # devise_scope :users do
  #   get '/', to: "devise/sessions#new"
  # end
  # root to: "sessions#index"


  devise_for :users, :controllers => { registrations: 'registrations' }
  authenticated :user do
    root to: 'vendors#index'
  end

  root to: "sessions#index"


  get '/forum', to: 'posts#forum'
  get '/reviews', to: 'reviews#index'
  get '/documents/:id/download', to: 'documents#download', as: :download

  resources :users

  resources :documents, only: [:new, :create, :index, :show, :destroy]

  resources :roles, only: [:new, :create]
  post '/admin', to: 'roles#admin'
  post '/member', to: 'roles#member'

  resources :posts, only: [:new, :create, :edit, :update, :destroy]

  resources :privacy, only: [:edit, :update]

  resources :organisations, only: [:new, :create, :edit, :update]

  resources :password_resets

  resources :vendors do
    resources :reviews
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
