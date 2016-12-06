class PostsController < ApplicationController
  def forum
    @searched_posts = nil  
  	if admin?
  	  @user = User.find(session[:user_id])
  	end
  	
  	if logged_in?
      @posts = Post.all.order(created_at: :desc)
      if params[:title_search]
        @searched_posts = Post.search(params[:title_search])
        params.delete :title_search
      end
	  else
	    flash[:access] = "Unauthorized access, please log in."
	    redirect_to '/'
	  end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to '/forum'
    else
      render 'new'
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to '/forum'
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to '/forum'
    else
      render 'edit'
    end  
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
