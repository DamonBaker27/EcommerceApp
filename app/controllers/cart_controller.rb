class CartController < ApplicationController
  helper_method :calculate_gst
  helper_method :calculate_pst

  def index
    @cart = Product.find(session[:shopping_cart])
    @sub_total = 0
    @total = 0
    @gst_amount = 0
    @pst_amount = 0

    @cart.each do |item|
      @sub_total += item.Price
    end

    @province = Province.find(current_user.province_id)
    @total = @gst_amount + @pst_amount + @sub_total
  end

  def calculate_gst
    @gst_amount = @subtotal * 0.05 if @province.tax.gst.present?
  end

  def calculate_pst
    @pst_amount = @sub_total * 0.07
  end
end
