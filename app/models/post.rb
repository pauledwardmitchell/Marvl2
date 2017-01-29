class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def self.search(search)
    if search
      @posts = Post.where("LOWER(title) LIKE ?", "%#{search}%").order(created_at: :desc).take(5)
    end
    @posts
  end

end
