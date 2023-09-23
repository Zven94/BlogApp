class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  # Callback to update user's post_counter
  after_create :update_user_post_counter

  # Methods
  def update_user_post_counter
    author.update(post_counter: author.posts.count)
  end

  def return_most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end