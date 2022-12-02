class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, :cart_id, :quantity, presence: true

  def total
    product.Price * quantity
  end
end
