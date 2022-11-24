class Add < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_orders, :order, null: true, foreign_key: true
    add_reference :user_orders, :user, null: true, foreign_key: true
    add_reference :order_items, :order, null: true, foreign_key: true
    add_reference :order_items, :product, null: true, foreign_key: true
  end
end
