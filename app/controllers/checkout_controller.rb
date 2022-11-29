class CheckoutController < ApplicationController
  def create
    # establish a connection to Stripe and then redirect the user to the payment screen
    Stripe.api_key = "sk_test_51M71cXAa7W4k6Y8xFvSZtphPo8Hoj0ebHPs0eEwbF6Z9wv4gIe7aSghzpwVNIaXvb8Nc5zTv9OVopyJNwIbjGTzt00nY2rovSz"
    @cart = Cart.find(session[:cart_id])
    @cart.orderables.each do |i|
      puts @product = Product.find_by(id: i.product_id)
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           [
        {
          price_data: {
            currency:     "cad",
            unit_amount:  (@product.Price * 100).to_i,
            product_data: {
              name:        @product.Name,
              description: @product.Description.empty? ? @product.Description : "No Description"
            },
            tax_behavior: "exclusive"
          },
          quantity:   1
        },
        {
          price_data: {
            currency:     "cad",
            unit_amount:  (@product.Price * 100 * current_user.province.tax.gst).to_i,
            product_data: {
              name:        "gst",
              description: "Goods and Services Tax"
            },
            tax_behavior: "exclusive"
          },
          quantity:   1
        },
        {
          price_data: {
            currency:     "cad",
            unit_amount:  (@product.Price * 100 * current_user.province.tax.pst).to_i,
            product_data: {
              name:        "Pst",
              description: "Provincal Sales Tax"
            },
            tax_behavior: "exclusive"
          },
          quantity:   1
        }

      ],
      mode:                 "payment"
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    # we took the customer's money
    redirect_to create_order_path(@cart.id)
    # @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    # @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # something went wrong with payment!
  end
end
