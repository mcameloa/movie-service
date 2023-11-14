Rails.application.routes.draw do
  resources :movies, only: [:index, :show]

  get "up" => "rails/health#show", as: :rails_health_check
end
