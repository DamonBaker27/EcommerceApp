class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables

  def subtotal
    orderables.to_a.sum { |orderable| orderable.total }
  end
end
