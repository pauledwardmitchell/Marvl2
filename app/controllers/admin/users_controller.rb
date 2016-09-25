class Admin::UsersController < ApplicationController
  include ApplicationHelper
  before_action :require_admin

  def index
    @users = User.order(:last_name)
  end

  def require_admin
    unless admin?
      flash[:alert] = "Please log in with admin credentials"
      redirect_to root_path
    end
  end

end
