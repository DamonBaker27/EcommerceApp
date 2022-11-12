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
