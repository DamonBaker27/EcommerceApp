class Addcolumntotable < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :quantity, :integer
    add_column :order_items, :price, :integer
  end
end
