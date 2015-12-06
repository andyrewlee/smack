Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :messages, only: [:index, :create, :show] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:new, :create]

  root 'sessions#new'
end
