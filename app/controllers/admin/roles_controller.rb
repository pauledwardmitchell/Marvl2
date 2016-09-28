class Admin::RolesController < ApplicationController

  def create
    User.find(params[:user_id]).add_role(params[:role_id])
    if request.xhr?
      render json: params[:user_id]
    else
      redirect_to admin_users_path
    end
  end

end

