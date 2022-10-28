class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :Name
      t.string :Description
      t.integer :Price
      t.integer :Stock

      t.timestamps
    end
  end
end
