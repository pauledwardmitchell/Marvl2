class VendorsController < ApplicationController

  #before_action :require_login
  before_action :authenticate_user!

  def index
    @user = current_user
    @vendors = Vendor.all
    @categories = Category.all.order('name ASC')
    @offerings = Offering.all
    @vendor = Vendor.new
    @vendor_hashes = []

    @vendors.each do |vendor|
      vendor_hash = {
        vendor_id: vendor.id,
        vendor_name: vendor.name,
        vendor_reviews_count: vendor.reviews.count,
        vendor_avg_rating: vendor.avg_rating
      }
      @vendor_hashes << vendor_hash
    end

    @data = {
      vendors: @vendors,
      categories: @categories,
      offerings: @offerings,
      vendor_hashes: @vendor_hashes
    }
  end

  def show
    @vendor = Vendor.find(params[:id])
    @reviews = @vendor.reviews
    @vote = Vote.new
    @offering = Offering.new
    @categories = Category.all
  end

  def new
    @vendor = Vendor.new
    @vendors = Vendor.all
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      redirect_to "/vendors/"+@vendor.id.to_s+"/offerings/new"
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
