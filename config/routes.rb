Rails.application.routes.draw do

  root 'users#index'

  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]

  get 'sign-up' => 'users#new'
  get 'log-out' => 'sessions#destroy'
  get 'log-in' => 'sessions#new'

end
