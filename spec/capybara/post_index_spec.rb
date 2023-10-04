require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before do

    @user = User.create(name: 'John Doe', photo: 'url_1', bio: 'Bio_1', post_counter: 3)
    @post = Post.create(title: 'Example Post', text: 'This is an example post', author: @user)
    @comment = Comment.create(text: 'First comment', author: @user, post: @post)
    
  end

  scenario 'Showing a list with all posts' do
    visit user_posts_path(@user)

    expect(page).to have_content('All Posts')
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.text)
    expect(page).to have_content('author id:')
  end

  scenario 'Creating new post' do
    visit new_user_post_path(@user)

    fill_in 'Title', with: 'New Post'
    fill_in 'Text', with: 'Content of the new post'
    click_button 'Create Post'

    expect(page).to have_content('No comments yet')
    expect(page).to have_content('New Post')
    expect(page).to have_content('Content of the new post')
  end
end
