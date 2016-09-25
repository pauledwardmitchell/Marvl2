class UsersController < ApplicationController

  def show
  	if logged_in?
    	@user = User.find(params[:id])
    	@reviews = @user.reviews.limit(5)
 	 	else
    	flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
    	redirect root
    end
  end
  
end
