Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/friendships/requests", to: 'friendships#requests'
  post "/friendships/accept", to: 'friendships#accept'

  resources :friendships, only: [:index, :show, :destroy,:create] do
    resources :gift_recommendations, only: [:index]
  end

  resources :sessions, only: [:new, :create]

end
