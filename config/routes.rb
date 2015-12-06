Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :messages, only: [:show] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:new, :create, :show]

  root 'sessions#new'
end
