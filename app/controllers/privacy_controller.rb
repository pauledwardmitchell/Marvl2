class PrivacyController < ApplicationController

	def edit
    @user = User.find(current_user.id)
    @privacy = Privacy.find(params[:id])
	end

	def update
	end
end