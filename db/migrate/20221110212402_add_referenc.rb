class AddReferenc < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :categories, index: true, foreign_key: true
    remove_reference :products, :category, foreign_key: true
  end
end
