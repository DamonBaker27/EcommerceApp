class Product < ApplicationRecord
  validates :Name, :Description, :Price, :Stock, presence: true
  has_one_attached :image
  has_many :orderables
  has_many :carts, through: :orderables
  belongs_to :category
end
