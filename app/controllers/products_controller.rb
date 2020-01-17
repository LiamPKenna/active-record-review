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
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "#{@product.name} successfully updated!"
      redirect_to product_path
    else
      render :edit
    end
  end


  private 
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
