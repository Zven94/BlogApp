class User < ApplicationRecord
  has_many :author_id, foreign_key: 'author_id'
  has_many :user_id, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # validations 

  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  # methods
  
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
