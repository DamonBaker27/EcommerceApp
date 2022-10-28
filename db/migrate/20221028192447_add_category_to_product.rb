class AddCategoryToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :Category, :string
  end
end
