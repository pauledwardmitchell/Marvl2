class Post < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search
      @posts = Post.where("title LIKE ?", "%#{search}%")
    	binding.pry
    else
      Post.all
    end
  end

end
