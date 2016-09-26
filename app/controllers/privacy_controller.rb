class PrivacyController < ApplicationController

	def edit
    @user = User.find(params[:user_id])
    @privacy = Privacy.find_by(user_id: @user.id)
	end

	def update
	end
end