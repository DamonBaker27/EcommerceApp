class AddImagepathtoproducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :imagePath, :string
  end
end
