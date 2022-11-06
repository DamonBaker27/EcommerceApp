class CartController < ApplicationController
  helper_method :calculate_gst
  helper_method :calculate_pst

  def create
    # logger.debug("adding #{params[:id]} to cart.")
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.Name} added to cart."
    end

    redirect_to cart_index_path
  end

  def destroy
    id = params[:id].to_i
    logger.debug(id)
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    redirect_to cart_index_path

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
  end

  def calculate_gst
    @gst_amount = @subtotal * 0.05
  end

  def calculate_pst
    @pst_amount = @sub_total * 0.07
  end
end
