class AddReferenceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :products, index: true, foreign_key: true
  end
end
