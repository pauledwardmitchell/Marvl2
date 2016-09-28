module ApplicationHelper

  def logged_in?
    session.keys.include? "user_id"
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    else
      nil
    end
  end

  def admin?
    if logged_in?
      current_user.is_admin?
    else
      false
    end
  end


end

