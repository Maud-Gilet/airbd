Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :albums do
    resources :rentals, only: [:create, :show]
  end

  resources :comics, only: [:create]

end
