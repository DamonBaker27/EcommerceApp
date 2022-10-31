class Product < ApplicationRecord
  validates :Name, :Description, :Price, :Stock, :Category, presence: true
  has_one_attached :image
end
