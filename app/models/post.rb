class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id' 
  has_many :comments
  has_many :likes
  
  def update_user_post_counter
    author.update(post_counter: author.posts.count)
  end
  
  def return_most_recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end