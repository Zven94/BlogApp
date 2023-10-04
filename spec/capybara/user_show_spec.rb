require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before do
    @user1 = User.create(name: 'User_1', photo: 'url_1', bio: 'Bio_1', post_counter: 3)
    @user2 = User.create(name: 'User_2', photo: 'url_2', bio: 'Bio_2', post_counter: 5)
    @post1 = Post.create(title: 'Post_1', text: 'Text_1', author_id: @user1.id)
    @post2 = Post.create(title: 'Post_2', text: 'Text_2', author_id: @user1.id)
    @post3 = Post.create(title: 'Post_3', text: 'Text_3', author_id: @user2.id)
    @post4 = Post.create(title: 'Post_4', text: 'Text_4', author_id: @user2.id)
    visit user_path(@user1)
  end

  it 'displays the user\'s profile information' do
    expect(page).to have_content(@user1.name.to_s)
    expect(page).to have_content(@user1.bio.to_s)
  end

  it 'displays a list of the user\'s posts' do
    visit user_path(@user2)
    expect(page).to have_content('Post_3')
    expect(page).to have_content('Post_4')
  end

  it 'links to individual post pages' do
    visit user_path(@user1)
    click_link 'Post_1'
    expect(page).to have_content(@user1.name.to_s)
    expect(page).to have_content(@post1.title.to_s)
  end
end
