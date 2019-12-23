Rails.application.routes.draw do

  root 'users#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]
  resources :hashtags, only: [:show]

  get 'sign-up' => 'users#new'
  get 'log-out' => 'sessions#destroy'
  get 'log-in' => 'sessions#new'

end
