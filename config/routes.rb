Rails.application.routes.draw do
  root "games#index"

  resources :games, only: [:create, :index, :show]
end
