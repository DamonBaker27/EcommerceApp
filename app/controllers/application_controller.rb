class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def initialize_session
    # empty array of product ids
    session[:shopping_cart] ||= []
  end

  def cart
    Product.find(session[:shopping_cart])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :province)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :province, :current_password)
    end
  end
end
