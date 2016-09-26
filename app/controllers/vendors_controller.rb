class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    @categories = Category.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @reviews = @vendor.reviews
  end

end