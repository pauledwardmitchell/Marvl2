class UserMailer < ApplicationMailer
	def membership(user)
		@user = user
		@url = "45.55.84.132/login"
		mail(to: @user.email, subject: "Welcome to MARVL - Your Account has been Approved!")
	end

	def flagged(review)
		@roles = Role.find_by(name: "Admin")
		@admins = @roles.users
		emails = @admins.map {|admin| admin.email} 
		@url = "45.55.84.132/login"
		mail(to: emails, subject: "A Review has been Flagged on MARVL")
	end
end

