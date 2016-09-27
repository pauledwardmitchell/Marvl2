class UserMailer < ApplicationMailer

	def membership_approved(user)
		@user = user
		@url = "45.55.84.132/login"
		mail(to: @user.email, subject: "Welcome to MARVL - Your Account has been Approved!")
	end 
end