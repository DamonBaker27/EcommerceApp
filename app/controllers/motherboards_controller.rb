class MotherboardsController < ApplicationController
  def index
    @motherboard = Product.where(category: "motherboards")
  end
end
