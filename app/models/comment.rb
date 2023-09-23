class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  after_save :update_user_comment_counter

  def update_user_comment_counter
    post.update(comment_counter: post.comments.count)
  end
end
