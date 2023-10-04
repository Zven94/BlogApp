require 'rails_helper'

RSpec.feature 'New Post Form', type: :feature do
  before do
    @user = User.create(name: 'John Doe', photo: 'url_1', bio: 'Bio_1', post_counter: 3)
  end

  scenario 'Creating a new post' do
    visit new_user_post_path(@user)

    expect(page).to have_content("Create New Post for #{@user.name}")

    within 'form.new-post-form' do
      fill_in 'Title', with: 'New Post'
      fill_in 'Text', with: 'New post content'
      click_button 'Create Post'
    end

    expect(page).to have_content('New Post')
    expect(page).to have_content('New post content')
  end

  scenario 'Back to list of posts' do
    visit new_user_post_path(@user)

    within 'form.new-post-form' do
      click_link 'Back'
    end
    expect(current_path).to eq(user_posts_path(@user))
  end
end
