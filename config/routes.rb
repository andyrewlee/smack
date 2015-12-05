Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :messages, only: [:index, :create]
  resources :users, only: [:new, :create]

  root 'sessions#new'
end
