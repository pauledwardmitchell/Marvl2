class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.limit(5)
    @expiration = @user.date_format(@user.membership_expiration)
  end

  def index
    
  end
end
