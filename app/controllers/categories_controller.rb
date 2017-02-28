class CategoriesController < ApplicationController

  before_action :require_login

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @reviews = @category.reviews.order(created_at: :desc).take(3)
    @vote = Vote.new
  end

end