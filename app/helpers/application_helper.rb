module ApplicationHelper

	def logged_in?
    current_user != nil
  end 

  #broke these into two helper methods with the anticipation that eventually we will need to check admin vs. user
  def current_user
     User.find(session[:user_id])
  end
end
