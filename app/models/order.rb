class Order < ApplicationRecord
  has_many :user_orders
  has_many :users, through: :user_orders

  has_many :order_items
  has_many :products, through: :order_items
end
