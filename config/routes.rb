Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :movies do
    resources :reviews, only: [:index, :show, :create]
  end

  get '/users/reviews', to: 'reviews#user_reviews'

  get "up" => "rails/health#show", as: :rails_health_check
end
