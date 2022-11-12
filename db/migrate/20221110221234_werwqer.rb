class Werwqer < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :Category
  end
end
