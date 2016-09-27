class VendorsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @review
    else
      render 'new'
    end
  end


  private
  def vote_params
  	params.require(:vote).permit(:helpful, :user_id, :review_id)
  end
end