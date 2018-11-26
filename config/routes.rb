Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/:id', to: 'users#show'

  resources :albums do
    resources :rentals, only: [:create, :show]
  end

  resources :comics, only: [:create]

end
