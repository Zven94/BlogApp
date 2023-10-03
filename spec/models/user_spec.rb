require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates presence of name' do
    user = User.new(post_counter: 0)
    expect(user).to_not be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
  it 'validates the post counter must be a positive number' do
    user = User.new(post_counter: -5)
    expect(user).to_not be_valid
    expect(user.errors[:post_counter]).to include('must be greater than or equal to 0')
  end
  it 'validates the recent post method' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 5)
    user.save
    recent_posts = user.recent_posts
    expect(recent_posts.count).to eq(0)
  end  
end
