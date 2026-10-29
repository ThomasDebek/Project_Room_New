Rails.application.routes.draw do

  root to:  "home#index"

  devise_for :admins,
             skip: [:registrations],
             path: "admin",
             path_names: {
               sign_in: "login",
               sign_out: "logout"
             }

  namespace :admin do
    root "dashboard#index"

    resources :projects do
      member do
        delete "images/:image_id",
               action: :destroy_image,
               as: :image
      end
    end
  end


  resources :projects, path: "realizacje", only: [:index, :show]
end
