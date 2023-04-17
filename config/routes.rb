Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users
  namespace :admin do
    resources :parkings
    resources :vehicle_types
    resources :parking_lots
  end

    resources :parkings
    put "/checkout", to: "parkings#checkout", as: "checkout"
    put "/admin/checkout", to: "admin/parkings#checkout", as: "admin_checkout"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
