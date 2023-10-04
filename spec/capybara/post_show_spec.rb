require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
  before do
    @user = User.create(name: 'John Doe', photo: 'url_1', bio: 'Bio_1', post_counter: 3)
    @post = Post.create(title: 'Example Post', text: 'This is an example post', author: @user)
    @comment1 = Comment.create(text: 'First comment', author: @user, post: @post)
    @comment2 = Comment.create(text: 'Second comment', author: @user, post: @post)
  end

  scenario 'Visualizar la página de un post' do
    visit user_post_path(@user, @post)

    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.author.name)
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Likes: 0')
    expect(page).to have_content(@post.text)
    expect(page).to have_css('.comments-li', count: 2)
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment2.author.name)
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
  end
end
