class UsersController < ApplicationController

before_action :authenticate_user!, except: [ :new, :create ]

  def index
    if admin?
      @organisations = Organisation.order(:name)
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

  def super_admin_delete
    @super_admin_emails = ['felipe@cpa.coop', 'lauren@cpa.coop', 'pauledwardmitchell@gmail.com']
    if @super_admin_emails.include? current_user.email
      @active_users = User.all.where.not(status: 'inactive')
      @inactive_users = User.all.where(status: 'inactive')
      @users = User.all
      @user_hashes = []

      @active_users.each do |user|
        user_hash = {
          user_id: user.id,
          user_name: user.full_name,
          user_status: user.status,
          user_organisation: user.organisation.name || nil
        }
        @user_hashes << user_hash
      end

      @data = {
        user_hashes: @user_hashes
      }
    else
      redirect_to current_user
    end

  end

  def edit
  	@user = User.find(params[:id])
  	unless @user.id == current_user.id
			flash[:access] = "Unauthorized access, please contact an administrator if you believe this error is incorrect."
      redirect_back
		end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
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

  # def patch
  #   @user = User.find(current_user.id)
  #   if @user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render "edit_password"
  #   end
  # end

  private
  def user_params
    params.require(:user).permit!
  end
end
