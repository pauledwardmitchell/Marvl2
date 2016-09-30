class PostsController < ApplicationController
  def forum
  	if logged_in?
	    @posts = Post.all
	    @searched_posts = Post.search(params[:title_search])
	  else
	  	flash[:access] = "Unauthorized access, please log in."
	  	redirect_to '/'
	  end
  end


end
