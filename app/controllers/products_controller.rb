class ProductsController < ApplicationController
  def index
    @products = Product.where(category: params[:category])
  end

  def show
    @product = Product.find(params[:id])
  end
end
