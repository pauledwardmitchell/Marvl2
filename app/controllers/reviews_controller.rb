class ReviewsController < ApplicationController

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
      redirect_to @review
    else
      render 'new'
    end 
  end

  private
    def review_params
      params.require(:review).permit(:title, :content, :rating, :flagged, :vendor_id, :user_id)
    end
end