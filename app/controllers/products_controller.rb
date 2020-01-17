class ProductsController < ApplicationController
  def home
    render :home
  end

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "#{@product.name} successfully added!"
    else
      render :new
    end
  end
end
