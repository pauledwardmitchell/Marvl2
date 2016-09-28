class ReviewsController < ApplicationController

  def index
    @categories = Category.all  
    @reviews = Review.all
    @recent_reviews = Review.all.order(created_at: :desc).take(5)
  end

  def show
  	@vendor = Vendor.find(params[:vendor_id])
  	@review = Review.find(params[:id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @review = Review.new
  end

  def create
  	@vendor = Vendor.find(params[:vendor_id])
    @review = Review.new(review_params)

    if @review.save
      redirect_to @vendor
    else
      render 'new'
    end 
  end

  def edit
    @review = Review.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
  end

  def update
    @review = Review.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
    
    if @review.update(review_params)
      redirect_to @vendor
    else
      render 'edit'
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :content, :rating, :flagged, :vendor_id, :user_id)
    end
end