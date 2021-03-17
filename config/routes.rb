Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'business', to: 'pages#business'
  get 'hosts', to: 'pages#hosts'
  get 'membership', to: 'pages#membership'
  get 'privacy', to: 'pages#privacy'
  get 'support', to: 'pages#support'
  get 'guidelines', to: 'pages#guidelines'
  get 'terms', to: 'pages#terms'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index] do
    member do
      post :accept
      post :reject
    end
  end

  resources :workspaces do
    resources :bookings, only: [:new, :create, :edit, :update]
    resources :favorites, only: [:index, :create, :destroy]
    resources :reviews, only: [:new, :create, :edit]
  end

  resources :users, only: [:show, :edit, :update]
end
