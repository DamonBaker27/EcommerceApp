class ApplicationController < ActionController::Base
  before_action :set_render_cart
  before_action :initialize_cart
  helper_method :cart

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_render_cart
    @render_cart = true
    # empty array of product ids
    # session[:shopping_cart] ||= []
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def cart
    Product.find(session[:shopping_cart])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :province_id, :address)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :province_id, :address, :current_password)
    end
  end
end
