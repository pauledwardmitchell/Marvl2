class OfferingsController < ApplicationController

  def create
  	@vendor = Vendor.find(params[:vendor_id])
    @offering = Offering.new(offering_params)
  	binding.pry

    if @offering.save
      redirect_to @vendor
    else
      
    end
  end

  private
  def offering_params
  	params.require(:offering).permit(:vendor_id, :category_id)
  end

end
