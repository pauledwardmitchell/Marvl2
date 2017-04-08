module ApplicationHelper

  def logged_in?
    session.keys.include? "user_id"
  end

  def admin?
    if user_signed_in?
      current_user.is_admin?
    else
      false
    end
  end

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end

  def my_home
    if current_user
      user_path(current_user.id)
    else
      '/'
    end
  end

  def reviews_for_category?(category)
    @all_reviews.select { |review| review.vendor.categories.include? category }.sort_by { |review| review[:created_at] }.take(3) != nil
  end


end

