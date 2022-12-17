class Renamename < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :Name, :name
  end
end
