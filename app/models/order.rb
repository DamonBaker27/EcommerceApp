class Order < ApplicationRecord
  has_many :order_items
  has_many :users, through: :user_orders
  has_many :products, through: :order_items
end
