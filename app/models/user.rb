class User < ApplicationRecord
  has_many :author_id, foreign_key: 'author_id'
  has_many :user_id, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end