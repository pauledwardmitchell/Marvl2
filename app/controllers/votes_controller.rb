class VotesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @vendor = Vendor.find(params[:vendor_id])
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @vendor
    else
      redirect_to @vendor
    end
  end


  private
  def vote_params
  	params.require(:vote).permit(:helpful, :user_id, :review_id)
  end
end