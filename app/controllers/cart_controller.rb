class CartController < ApplicationController
  helper_method :calculate_gst
  helper_method :calculate_pst
  helper_method :calculate_hst
  helper_method :calculate_total

  def show
    @cart = Cart.find(session[:cart_id])
    @total = @cart.subtotal
    @province = Province.find(current_user.province_id)
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity.positive?
      current_orderable.update(quantity: quantity)
      redirect_to cart_path
      flash[:notice] = "#{@product.name} quantity updated."
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity: quantity)
      redirect_to product_path(@product.id)
      flash[:notice] = "#{@product.name} added to cart."
    end
  end

  def remove
    Orderable.find(params[:id]).destroy
    redirect_to cart_path
    flash[:notice] = "Item removed from cart."
  end

  def calculate_gst
    (@province.tax.gst * @cart.subtotal.round(2)) if current_user.province.tax.gst.present?
  end

  def calculate_pst
    (@province.tax.pst * @cart.subtotal.round(2)) if current_user.province.tax.pst.present?
  end

  def calculate_hst
    (@province.tax.hst * @cart.subtotal.round(2)) if current_user.province.tax.hst.present?
  end

  def calculate_total
    (calculate_gst + calculate_pst + calculate_hst + @cart.subtotal).round(2)
  end
end
