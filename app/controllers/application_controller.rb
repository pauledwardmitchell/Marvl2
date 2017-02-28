class ApplicationController < ActionController::Base
  include ApplicationHelper
	
  protect_from_forgery with: :exception

  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

end
