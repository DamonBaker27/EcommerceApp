class AddPaymentToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :paymentId, :string
  end
end
