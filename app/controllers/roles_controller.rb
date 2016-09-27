class RolesController < ApplicationController

	def new
    @roles = Role.new
	end

	def create
		@user = User.find(current_user.id)
		@role = Role.find_by(name: "Ambassador")x
		@user.add_role(@role.id)
    redirect_to @user
	end

	def admin
		@user = User.find(params[:user_id])
		@role = Role.find_by(name: "Admin")
		@user.add_role(@role.id)
		flash[:role] = "Admin role has been added"
		redirect_to @user
	end

	def member
		@user = User.find(params[:user_id])
		@role = Role.find_by(name: "Member")
		@user.add_role(@role.id)
		UserMailer.membership(@user).deliver_now
		flash[:role] = "Membership approved"
		redirect_to @user
	end
end
