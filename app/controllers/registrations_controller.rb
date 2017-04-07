class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      @user = User.last

      Privacy.create(user_id: @user.id)

      @role = Role.find_by(name: "Member")

      @user.add_role(@role.id)
    end
    binding.pry
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :organisation_id, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :organisation_id, :email, :password, :password_confirmation, :current_password)
  end

end
