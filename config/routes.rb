Rails.application.routes.draw do
  root to:  "home#index"

  resources :projects, path: "realizacje", only: [:index, :show]
end
