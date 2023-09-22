class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  def update_user_comment_counter
    author.update(comment_counter: author.comments.count)
  end
end