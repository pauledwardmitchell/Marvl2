class OfferingsController < ApplicationController

  before_action :require_login

  def create
  	@vendor = Vendor.find(params[:vendor_id])
    @offering = Offering.new(offering_params)
    @categories = Category.all
binding.pry
    if @offering.save
      redirect_to "/vendors/"+@vendor.id.to_s+"/reviews/new"
    else
      flash[:notice] = "Category not saved"
      render 'new'
    end
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @offering = Offering.new
    @categories = Category.all
  end

  private
  def offering_params
  	params.require(:offering).permit(:vendor_id, :category_id)
  end

end
