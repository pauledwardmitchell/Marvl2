class OrganisationsController < ApplicationController

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @user = User.find(current_user.id)

    if @organisation.save
      redirect_to '/users'
    else
      redirect_to new_organisation_path
    end
  end

  private
  def organisation_params
    params.require(:organisation).permit(:name)
  end

end