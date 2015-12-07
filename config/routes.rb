Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :messages, only: [:show, :new, :create] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:new, :create, :show]

  root 'sessions#new'
end
