class GpusController < ApplicationController
  def index
    @gpus = Product.where(Category: "Graphics Cards")
  end
end
