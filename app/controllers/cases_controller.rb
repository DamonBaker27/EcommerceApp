class CasesController < ApplicationController
  def index
    @cases = Product.where(Category: "Computer Cases")
  end

  def show
    @case = Product.find(params[:id])
  end
end
