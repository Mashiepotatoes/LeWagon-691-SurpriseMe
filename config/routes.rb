Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'carts/:id' ,to: 'carts#show', as: "cart"

  post "/friendships/accept", to: 'friendships#accept'
  get "/friendships/requests", to: 'friendships#requests'
  get "/friendships/search", to: 'friendships#search'
  delete "/friendships/cancel/:id", to: 'friendships#cancel',as: :request_cancel

  post '/line_items' ,to: "line_items#create"
  delete '/line_items' ,to: "line_items#destroy"

  post '/line_items/reduce/:id', to: "line_items#reduce",as: :reduce

  resources :friendships, only: [:index, :destroy, :create, :show]

  resources :gift_sessions, only: [:new, :create, :show, :update] do
    resources :gift_recommendations, only: [:index]
  end

  resources :products

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :questions, only: [:show] do
    resources :answers, only: [:create, :edit, :update]
  end

  resources :response_sets, only: [:index]

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  resources :rating, only: [:create]
end
