class CartController < ApplicationController
  def create
    logger.debug("adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.Name} added to cart."

    end

    redirect_to cart_index_path, allow_other_host: true
  end

  def destroy
    id = params[:id].to_i
    logger.debug(id)
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "#{product.Name} removed from cart."
  end

  def index
    @cart = Product.find(session[:shopping_cart])
    @sub_total = 0
    @total = 0
    @gst_amount = 0
    @pst_amount = 0

    @cart.each do |item|
      @gst_amount += item.Price * 0.05
      @pst_amount += item.Price * 0.07
      @sub_total += item.Price
    end

    @total = @gst_amount + @pst_amount + @sub_total
    redirect_to
  end
end
