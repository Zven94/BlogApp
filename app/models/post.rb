class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  after_create :update_user_post_counter
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  after_save :update_user_post_counter

  # validations

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comment_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  # methods
  def update_user_post_counter
    author.update(post_counter: author.posts.count)
  end

  def return_most_recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
