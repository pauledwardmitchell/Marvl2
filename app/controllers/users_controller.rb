class UsersController < ApplicationController

before_action :authenticate_user!, except: [ :new, :create ]

  def index
    if admin?
      @organisations = Organisation.all
    else
      flash[:access] = "Unauthorized access, please log in."
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.limit(5)
    @expiration = @user.date_format(@user.membership_expiration)
    @privacy = @user.privacy
    @ambassador = @user.ambassador?
    @roles = Role.new
  end

  def edit
  	@user = User.find(params[:id])
  	unless @user.id == current_user.id
			flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_back
		end
  end

  def update
  	@user = current_user #User.find(params[:id])
    if @user.id == current_user.id
  		@user.update_attributes(title: params[:user][:title], first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])
	  	redirect_to @user
    else
      flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_to @user
    end
  end

  def new
    @user = User.new
    @organisations = Organisation.order(:name)
  end

  def create
    @user = User.new(user_params)
    # @organisation = Organisation.find(params[:user][:organisation_id])
    # if @organisation
    #   @user.organisation_id = @organisation.id
    # else
    #   @organisation = Organisation.create(name: params[:organisation])
    #   @user.organisation_id = @organisation.id
    # end
    if @user.save
      Privacy.create(user_id: @user.id)

      @role = Role.find_by(name: "Member")
      @user.add_role(@role.id)
      #UserMailer.membership(@user).deliver_now

      redirect_to root_path
      flash[:new] = "Welcome to MARVL!"
    else
      @errors = @user.errors.full_messages
      @organisations = Organisation.order(:name)
      render "new"
    end
  end

  # def edit_password
  #   @user = User.find(current_user.id)
  # end

  # def patch_password
  #   @user = User.find(current_user.id)

  #   if @user && @user.authenticate(params[:old_password])
  #     if params[:new_password_1] == params[:new_password_2]
  #       @user.password = params[:new_password_1]
  #       @user.save!
  #       flash[:notice] = "You have successfully changed your password."
  #       redirect_to @user
  #     else
  #       flash[:notice] = "Your new password entries do not match.  Please try again."
  #       redirect_to editpassword_path
  #     end
  #   else
  #     flash[:notice] = "Please enter your old password correctly."
  #     redirect_to editpassword_path
  #   end

  # end

  # def patch
  #   @user = User.find(current_user.id)
  #   if @user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render "edit_password"
  #   end
  # end

  # def ambassadors
  #   @ambassadors = Role.where(name: "Ambassador")
  # end

  # def samplevendors
  #   @vendors = Vendor.all.limit(5)
  # end

  private
  def user_params
    params.require(:user).permit!
  end
end
