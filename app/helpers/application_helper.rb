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

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end

  def my_home
    if logged_in?
      user_path(session[:user_id])
    else
      '/'
    end
  end


end

