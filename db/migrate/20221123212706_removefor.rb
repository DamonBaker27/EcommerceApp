class Removefor < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_orders, :orders, null: true, foreign_key: true
    remove_reference :user_orders, :users, null: true, foreign_key: true
    remove_reference :order_items, :orders, null: true, foreign_key: true
    remove_reference :order_items, :products, null: true, foreign_key: true
  end
end
