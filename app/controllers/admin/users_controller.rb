class Admin::UsersController < ApplicationController
  include ApplicationHelper
  before_action :require_admin

  def index
    @users = User.order(:last_name)
    @memberrole_id = Role.find_by(name: 'Member').id
    @adminrole_id = Role.find_by(name: 'Admin').id
  end

  def require_admin
    unless admin?
      flash[:alert] = "Please log in with admin credentials"
      redirect_to root_path
    end
  end

end
