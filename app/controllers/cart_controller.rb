class CartController < ApplicationController
  def create
    logger.debug("adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.Name} added to cart."

    end

    @cart = Product.find(session[:shopping_cart])
    @sub_total = 0

    @cart.each do |item|
      @sub_total += item.Price
    end

    redirect_to cart_index_path
  end

  def destroy
    id = params[:id].to_i
    logger.debug(id)
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "#{product.Name} removed from cart."
  end
end
