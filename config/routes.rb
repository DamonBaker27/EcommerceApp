Rails.application.routes.draw do
  # devise_for :models
  # devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"

  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"

  # /checkout/create something
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  # resources :products
  resources :products do
    collection do
      get "search"
    end
  end
  get "cart", to: "cart#show"
  post "cart/add"
  delete "cart/remove"

  post "order/create"
  resources :category, only: %i[index show]
end
