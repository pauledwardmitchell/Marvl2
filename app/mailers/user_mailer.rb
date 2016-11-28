class UserMailer < ApplicationMailer
  default from: 'cpamarvlapp@gmail.com'

  def membership(user)
  	@user = user
  	@url = url_for controller: 'sessions', action: 'new'
  	mail(to: @user.email, subject: "Welcome to MARVL - Your Account has been Approved!")
  end

  def flagged(review)
  	@roles = Role.find_by(name: "Admin")
  	@admins = @roles.users
  	emails = @admins.map {|admin| admin.email} 
  	@url = url_for controller: 'sessions', action: 'new'
  	mail(to: emails, subject: "A Review has been Flagged on MARVL")
  end

  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: "Password Reset")
  end

end

