class ReviewsController < ApplicationController
  before_action :authorize
  skip_before_action :authorize, only: [:show]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "#{@review.author} successfully added a review!"
      redirect_to product_review_path(@product, @review)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "#{@review.author} successfully updated their post!"
      redirect_to product_path(params[:product_id])
    else
      @product = Product.find(params[:product_id])
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product_id)
  end

  private
  def review_params
    params.require(:review).permit(:author, :rating, :content_body)
  end
end
