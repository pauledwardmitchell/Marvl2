class RolesController < ApplicationController

  before_action :require_login

	def new
    @roles = Role.new
	end

	def create
		@user = User.find(current_user.id)
		@role = Role.find_by(name: "Ambassador")
		@user.add_role(@role.id)
    redirect_to @user
	end

	def admin
		@user = User.find(params[:user_id])
		@role = Role.find_by(name: "Admin")
		@user.add_role(@role.id)
		if request.xhr?
			true
		else
			flash[:role] = "Admin role has been added"
			redirect_to @user
		end
	end

	def member
		@user = User.find(params[:user_id])
		@role = Role.find_by(name: "Member")
		@user.add_role(@role.id)
		UserMailer.membership(@user).deliver_now
		if request.xhr?
			true
		else
			flash[:role] = "Membership approved"
			redirect_to @user
		end

	end
end
