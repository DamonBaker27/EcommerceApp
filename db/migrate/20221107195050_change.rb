class Change < ActiveRecord::Migration[7.0]
  def change
    change_column(:products, :Price, :real)
  end
end
