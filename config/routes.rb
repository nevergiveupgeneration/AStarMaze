Rails.application.routes.draw do
  root "games#index"

  resources :games, only: [:create, :index, :show] do
    post "/toggle/:x/:y", to: "games#toggle"
  end


end
