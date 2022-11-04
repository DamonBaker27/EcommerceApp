Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"

  resources :cases
  resources :gpus
  resources :cart, only: %i[create destroy]
  resources :products, only: %i[index show]

  get "/gpus/", to: "gpus#index"

  get "/cases/", to: "cases#index"

  get "/ram/", to: "memory#index"

  get "/motherboards/", to: "motherboards#index"

  get "processors/", to: "processors#index"
end
