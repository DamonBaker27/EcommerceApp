class ProcessorsController < ApplicationController
  def index
    @processors = Product.where(Category: "Computer Processors")
  end
end
