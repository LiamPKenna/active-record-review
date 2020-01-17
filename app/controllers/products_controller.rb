class ProductsController < ApplicationController
  def home
    render :home
  end

  def index
    @products = Product.all
    if params[:sort]
      case params[:sort]
      when 'name_a'
        @products = Product.by_name_a
      when 'name_z'
        @products = Product.by_name_z
      when 'low'
        @products = Product.by_low_price
      when 'high'
        @products = Product.by_high_price
      end
    end
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end


  private 
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
