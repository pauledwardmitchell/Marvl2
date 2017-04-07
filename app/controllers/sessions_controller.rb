class SessionsController < ApplicationController

  #before_filter :authenticate_user!

  def index
    if user_signed_in?
      redirect_to '/vendors'
    end
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.find_by(email: params[:email])
  #     if @user && @user.authenticate(params[:password])
  #       if @user.roles.any?
  #         session[:user_id] = @user.id
  #         redirect_to '/vendors'
  #       else
  #         flash[:notice] = "Your account has not yet been confirmed by an admin, please check back later"
  #         redirect_to '/'
  #       end
  #     else
  #       flash[:notice] = "Invalid email/password combination, please try again"
  #       render 'new'
  #     end
  # end

  # def destroy
  #   session[:user_id] = nil
  #   flash[:notice] = "Logged Out"
  #   redirect_to root_path
  # end
end
