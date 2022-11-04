class CartController < ApplicationController
  def create
    logger.debug("adding #{params[:id]}to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.Name} added to cart."

      redirect_to root_path
    end
  end

  def destroy; end
end
