class User < ApplicationRecord
  has_many :author_id, foreign_key: 'author_id'
  has_many :user_id, foreign_key: 'user_id'
  has_many :comments
  has_many :likes
  has_secure_password
end
