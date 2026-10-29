Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
  root to:  "home#index"

  resources :projects, path: "realizacje", only: [:index, :show]
end
