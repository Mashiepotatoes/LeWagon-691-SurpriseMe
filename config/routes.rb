Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :friendships, only: [:index, :show, :destroy]

  resources :sessions, only: [:new, :create, :show] do
    resources :gift_recommendations, only: [:index]
  end
end
