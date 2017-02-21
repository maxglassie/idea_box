Rails.application.routes.draw do

  get '/sign-up', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  resources :users, only: [:create, :show]
  resources :ideas, only: [:new, :index, :create, :show]

  namespace :admin do
    resources :users, only: [:index]
  end
end
