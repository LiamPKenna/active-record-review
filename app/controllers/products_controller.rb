class ProductsController < ApplicationController
  before_action :authorize
  skip_before_action :authorize, only: [:show, :index, :home]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def home
    @most = Product.most_reviews.first
    @products = Product.newest
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
      when 'rating'
        @products = Product.all.sort { 
          |a,b| b.average_rating <=> a.average_rating
        }
      end
    end
    if params[:origin]
      @origin = params[:origin]
      if @origin == 'USA'
        @products = Product.usa
      else
        @products = Product.from_origin(params[:origin])
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
    @product.product_photo.attach(params[:product][:product_photo])
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
    params.require(:product).permit(:name, :cost, :country_of_origin, :product_photo)
  end
end
