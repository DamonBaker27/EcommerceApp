class Asdfasdfasdfasdf < ActiveRecord::Migration[7.0]
  def change
    remove_reference :categories, :products, index: true, foreign_key: true
    remove_reference :products, :category, index: true, foreign_key: true
  end
end
