class UsersController < ApplicationController

  def show
  	if logged_in?
    	@user = User.find(params[:id])
    	@reviews = @user.reviews.limit(5)
      @expiration = @user.date_format(@user.membership_expiration)
    else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      # can change to redirect root_path once we have established what that is
      redirect_to '/'
    end
  end

  def edit
  	@user = User.find(params[:id])
  	unless @user.id == current_user.id
			flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_to :back
		end
  end

  def update
  	@user = User.find(params[:id])
    if @user.id == current_user.id
  		@user.update_attributes(title: params[:user][:title], first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])
	  	redirect_to @user
    else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_to @user
    end
  end

end
