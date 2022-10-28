class CasesController < ApplicationController
  def index
    @cases = Product.where(Category: "Computer Cases")
  end
end
