class Product < ApplicationRecord
  validates :Name, :Description, :Price, :Stock, presence: true
  has_one_attached :image
  has_many :order_items
  belongs_to :category
end
