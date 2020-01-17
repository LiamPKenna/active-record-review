class ProductsController < ApplicationController
  def home
    render :home
  end

  def index
    @products = Product.all
    render :index
  end
end
