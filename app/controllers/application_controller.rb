class ApplicationController < ActionController::Base
  include ApplicationHelper
	
  protect_from_forgery 
  
  # before_action :authenticate_user!

  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end


  private
 
  def after_sign_out_path_for(user)
    ambassadors_path
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

end
