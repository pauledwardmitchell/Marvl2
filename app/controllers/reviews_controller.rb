class ReviewsController < ApplicationController

  def show
  	@vendor = Vendor.find(params[:vendor_id])
  	@review = Review.find(params[:id])
  end

end