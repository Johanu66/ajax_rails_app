Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: "blogs#index"

  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions/new' , to: 'sessions#create', as: 'create_session'
  get '/sessions/destroy' , to: 'sessions#destroy', as: 'destroy_session'

  resources :users

  resources :blogs do
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end
end
