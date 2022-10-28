Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"

  get "/gpus/", to: "gpus#index"

  get "/cases/", to: "cases#index"
end
