require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'User_1', photo: 'url_1', bio: 'Bio_1', post_counter: 3)
    @user2 = User.create(name: 'User_2', photo: 'url_2', bio: 'Bio_2', post_counter: 5)
  end

  scenario 'User can see the username of all other users' do
    visit users_path

    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'User can see the profile picture and the number of posts each user has written' do
    visit users_path

    expect(page).to have_css("img[src*='url_1']")
    expect(page).to have_css("img[src*='url_2']")

    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('Number of posts: 5')
  end

  scenario 'User can click on a user and be redirected to their show page' do
    visit users_path
    click_link 'User_1'

    expect(page).to have_current_path(user_path(@user1))
  end
end
