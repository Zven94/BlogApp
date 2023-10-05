class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :authored_posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :user_posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # validations

  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  # methods

  def recent_posts
    return 'No posts yet' if post_counter.zero?

    posts.order(created_at: :desc).limit(3)
  end
end
