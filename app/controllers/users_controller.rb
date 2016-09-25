class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.limit(5)
  end

  def index
    
  end
end
