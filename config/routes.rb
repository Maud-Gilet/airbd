Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'pages#profile', as: :current_user_profile
  end

  root to: 'pages#home'

  # get 'users/:id', to: 'pages#profile'

  resources :albums do
    resources :rentals, only: [:create, :show]
  end

  resources :comics, only: [:create]

end
