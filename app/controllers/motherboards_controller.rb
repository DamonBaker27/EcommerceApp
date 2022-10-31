class MotherboardsController < ApplicationController
  def index
    @motherboards = Product.where(Category: "Motherboards")
  end
end
