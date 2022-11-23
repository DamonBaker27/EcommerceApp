class OrderItemsController < ApplicationController
  has_many :orders
  has_many :products
end
