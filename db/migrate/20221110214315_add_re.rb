class AddRe < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :categories, index: true, foreign_key: true
  end
end
