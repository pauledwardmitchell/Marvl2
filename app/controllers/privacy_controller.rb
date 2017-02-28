class PrivacyController < ApplicationController

  before_action :require_login

	def edit
    @user = User.find(params[:id])
    @privacy = Privacy.find_by(user_id: @user.id)
	end

	def update
		@user = User.find(params[:id])
		@privacy = Privacy.find_by(user_id: @user.id)
		if @privacy.user_id == current_user.id
  		@privacy.update_attributes(email_allowed: params[:privacy][:email_allowed], organisation_allowed: params[:privacy][:organisation_allowed], membership_allowed: params[:privacy][:membership_allowed], reviews_allowed: params[:privacy][:reviews_allowed])
	  	redirect_to @user
    else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_to root_path
    end
	end
end