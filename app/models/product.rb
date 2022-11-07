class Product < ApplicationRecord
  validates :Name, :Description, :Price, :Stock, presence: true
  has_one_attached :image
  has_many :order_items
  has_one :category
end
