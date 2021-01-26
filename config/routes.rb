Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :workspaces do
    resources :bookings, only: [:new, :edit, :show, :create, :update]
  end
  resources :bookings, only: [:delete]
  resources :workspaces do
    resources :reviews, only: [:new, :create]
  end
end


