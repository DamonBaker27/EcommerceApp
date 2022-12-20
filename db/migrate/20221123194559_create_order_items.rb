class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.timestamps
      t.integer :quantity
    end
  end
end
