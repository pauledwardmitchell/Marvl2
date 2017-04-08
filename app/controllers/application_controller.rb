class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :organisation_id])
  end


  private

  def after_sign_out_path_for(user)
    root_path
  end

  def after_sign_up_path_for(user)
    vendors_path
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

end
