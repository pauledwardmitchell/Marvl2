class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    @categories = Category.all
    @vendor = Vendor.new
  end

  def show
    @vendor = Vendor.find(params[:id])
    @reviews = @vendor.reviews
    @vote = Vote.new
    @offering = Offering.new
    @categories = Category.all
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      redirect_to @vendor
    else
      render 'index'
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])

    if @vendor.update(vendor_params)
      redirect_to @vendor
    else
      render 'edit'
    end
  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :street_address, :city, :state, :zip_code, :phone, :email, :website)
  end

end