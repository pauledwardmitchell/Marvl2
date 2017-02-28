class ReviewsController < ApplicationController

  before_action :require_login

  def index
    if logged_in?
      @categories = Category.all  
      @ratings = Review.where(user_id: nil)
      @reviews = Review.where.not(user_id: nil)
      @all_reviews = @reviews #sloppy kludge. Should replace all uses of @all_reviews with @reviews and delete this
      @recent_reviews = @reviews.order(created_at: :desc).take(5)
    else
      flash[:access] = "Unauthorized access, please log in."
      redirect_to '/'
    end
  end

  def show
  	@vendor = Vendor.find(params[:vendor_id])
  	@review = Review.find(params[:id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @review = Review.new
  end

  def create
  	@vendor = Vendor.find(params[:vendor_id])
    @review = Review.new(review_params)

    if @review.save
      redirect_to @vendor
    else
      render 'new'
    end 
  end

  def edit
    @review = Review.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
  end

  def update
    @review = Review.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
    
    if @review.update(review_params)
      redirect_to @vendor
    else
      render 'edit'
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :content, :rating, :flagged, :vendor_id, :user_id)
    end
end