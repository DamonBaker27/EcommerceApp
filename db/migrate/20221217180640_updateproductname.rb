class Updateproductname < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :Name, :productname
  end
end
