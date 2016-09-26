class PrivacyController < ApplicationController

	def edit
    @user = User.find(params[:id])
    @privacy = Privacy.find_by(user_id: @user.id)
	end

	def update
	end
end