class OrderController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    cart = Cart.find(session[:cart_id])
    user = User.find(current_user.id)
    order = Order.create
    userorder = UserOrder.create(order_id: order.id, user_id: user.id)

    cart.orderables.each do |item|
      puts "----------------------------------------"
      puts "quantity #{item.quantity}"
      puts "id #{item.id}"
      puts "product id #{Product.find(item.product_id).Price}"
      puts "----------------------------------------"
      OrderItem.create(
        quantity:   item.quantity,
        order_id:   order.id,
        product_id: Product.find(item.product_id).id
      )
    end
  end
end
