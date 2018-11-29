Rails.application.routes.draw do
  get 'requests/create'
  get 'requests/destroy'
  devise_for :users
  authenticated :user do
    root 'pages#dashboard', as: :current_user_dashboard
  end

  root to: 'pages#home'

  # get 'users/:id', to: 'pages#profile'

  resources :albums do
    resources :rentals, only: [:create, :show]
    resources :requests, only: [:create, :update]
  end

  resources :comics, only: [:new, :create]

end
