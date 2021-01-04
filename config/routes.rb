Rails.application.routes.draw do
  root "events#index"
  resources :users, only: [:show, :new, :create ]
  resources :events, only: [:show, :index, :new, :create]
  resources :attendances, only: [:new, :create]
  
  post '/', to: 'attendances#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
