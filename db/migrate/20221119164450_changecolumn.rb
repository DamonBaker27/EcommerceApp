class Changecolumn < ActiveRecord::Migration[7.0]
  def change
    change_column(:products, :Price, :decimal)
  end
end
