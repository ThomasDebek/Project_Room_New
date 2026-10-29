Rails.application.routes.draw do

  root to:  "home#index"

  devise_for :admins,
             skip: [:registrations],
             path: "admin",
             path_names: {
               sign_in: "login",
               sign_out: "logout"
             }

  resources :projects, path: "realizacje", only: [:index, :show]
end
