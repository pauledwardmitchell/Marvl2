module ApplicationHelper

  def logged_in?
    session.keys.include? "user_id"
  end

  #broke these into two helper methods with the anticipation that eventually we will need to check admin vs. user
  def current_user
    if logged_in?
      User.find(session[:user_id])
    else
      nil
    end
  end

  def admin?
    if logged_in?
      User.find(session[:user_id]).admin?
    else
      false
    end
  end
end
