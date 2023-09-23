require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Model: comments. Associations' do
    it 'belongs to a user' do
      association = Comment.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a post' do
      association = Comment.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  context 'Model: comments. Update_comments_counter' do
    it 'updates the comments_counter for the associated post' do
      user = User.create(name: 'Alice')
      post = Post.create(title: 'My Post', text: 'Some text', author: user)

      expect(post.comment_counter).to eq(0)

      Comment.create(author: user, post:, text: 'Some text')

      post.reload
      expect(post.comment_counter).to eq(1)
    end
  end
end
