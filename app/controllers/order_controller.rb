class OrderController < ApplicationController
  def index
    @order = Order.find
  end

  def create
    cart = session[:cart_id]
    user = User.find(current_user.id)
    order = order.create

    User_order.create(order: order, user: user)
  end
end
