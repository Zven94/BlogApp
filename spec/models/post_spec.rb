require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it 'requires a non-blank title' do
      user = User.create(name: 'testuser')
      post = Post.new(author: user, title: '', comment_counter: 0, likes_counter: 0)
      post.save
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'requires title not to exceed 250 characters' do
      long_title = 'A' * 251
      user = User.create(name: 'testuser')
      post = Post.new(author: user, title: long_title, comment_counter: 0, likes_counter: 0)
      post.save
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'requires comment_counter to be greater than or equal to zero' do
      user = User.create(name: 'testuser')
      post = Post.new(author: user, title: 'My Post', comment_counter: -1, likes_counter: 0)
      post.save
      expect(post).not_to be_valid
      expect(post.errors[:comment_counter]).to include('must be greater than or equal to 0')
    end

    it 'requires likes_counter to be greater than or equal to zero' do
      user = User.create(name: 'testuser')
      post = Post.new(author: user, title: 'My Post', comment_counter: 0, likes_counter: -1)
      post.save
      expect(post).not_to be_valid
      expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end

    it 'allows valid posts' do
      user = User.create(name: 'testuser')
      post = Post.new(author: user, title: 'My Post', comment_counter: 0, likes_counter: 0)

      expect(post).to be_valid
    end
  end

  context 'methods' do
    it 'updates user post_counter after create' do
      user = User.create(name: 'testuser')
      # expect(user.post_counter).to eq(0)
    
      post = Post.new(author: user, title: 'My Post', comment_counter: 0, likes_counter: 0)
      post.save
    
      expect(user.post_counter).to eq(1)
    end

    it 'returns the most recent comments, limited to 5' do
      user = User.create(name: 'testuser')
      post = Post.create(author: user, title: 'My Post', text: 'Some text', comment_counter: 0, likes_counter: 0)
      

      newest_comment = post.comments.create(author: user, text: 'This is the newest comment', created_at: Time.now)
      middle_comment1 = post.comments.create(author: user, text: 'This is a middle comment 1', created_at: 1.day.ago)
      middle_comment2 = post.comments.create(author: user, text: 'This is a middle comment 2', created_at: 2.days.ago)
      middle_comment3 = post.comments.create(author: user, text: 'This is a middle comment 3', created_at: 3.days.ago)
      older_comment = post.comments.create(author: user, text: 'This is an older comment', created_at: 4.days.ago)

      return_most_recent_comment = post.return_most_recent_comment

      expect(return_most_recent_comment).to eq([newest_comment, middle_comment1, middle_comment2, middle_comment3, older_comment])
    end
  end
end
