class Product < ApplicationRecord
  validates :Name, :Price, :Stock, presence: true
  has_one_attached :image

  has_many :orderables

  has_many :order_items
  has_many :orders, through: :order_items

  has_many :carts, through: :orderables
  belongs_to :category
end
