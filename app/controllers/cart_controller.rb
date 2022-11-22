class CartController < ApplicationController
  helper_method :calculate_gst
  helper_method :calculate_pst

  def show
    @cart = Cart.find(session[:cart_id])
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
      redirect_to cart_path
      flash[:notice] = "#{@product.Name} quantity updated."
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity: quantity)
      redirect_to product_path(@product.id)
      flash[:notice] = "#{@product.Name} added to cart."
    end
  end

  def remove
    Orderable.find(params[:id]).destroy
    redirect_to cart_path
  end
end
