class OrderController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart = Cart.find(session[:cart_id])
    user = User.find(current_user.id)
    payment_intent = params[:id]

    order = Order.create(paymentId: payment_intent)
    UserOrder.create(order_id: order.id, user_id: user.id)

    @cart.orderables.each do |item|
      OrderItem.create(
        quantity:   item.quantity,
        order_id:   order.id,
        product_id: Product.find(item.product_id).id
      )
    end

    cart = Cart.find(session[:cart_id])
    cart.orderables.destroy_all
  end

  def delete
    user = User.find(current_user.id)
    user.orders.destroy_all
    redirect_to order_index_path
  end
end
