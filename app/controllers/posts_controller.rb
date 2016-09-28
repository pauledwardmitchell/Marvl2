class PostsController < ApplicationController
  def forum
    @posts = Post.all
    @searched_posts = Post.search(params[:search])
  end


end
