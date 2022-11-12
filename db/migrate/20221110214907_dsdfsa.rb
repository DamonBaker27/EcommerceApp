class Dsdfsa < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :categories, index: true, foreign_key: true
  end
end
