class Product < ApplicationRecord
  validates :Name, :Description, :Price, :Stock, :Category, presence: true
end
