class CategoryController < ApplicationController
  def index
    @product = Category.where("name LIKE ?", "%" + params[:name] + "%")
  end
end
