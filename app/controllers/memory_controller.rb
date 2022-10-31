class MemoryController < ApplicationController
  def index
    @ram = Product.where(Category: "Memory (RAM)")
  end
end
