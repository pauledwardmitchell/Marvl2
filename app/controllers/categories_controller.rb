class CategoriesController < ApplicationController

  before_action :require_login, except: [:data]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @reviews = @category.reviews.order(created_at: :desc).take(3)
    @vote = Vote.new
  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to '/vendors'
    else
      render 'new'
    end
  end

  def data
    @categories = Category.all
    render json: @categories
  end

  private
  def category_params
  	params.require(:category).permit(:name)
  end

end
