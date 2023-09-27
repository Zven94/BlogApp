require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'Show a list of posts' do
      user = User.create(name: 'Example')
      get user_posts_path(user)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'show a single post' do
      user = User.create(name: 'Example')
      post = user.posts.create(title: 'Title Example')
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
    end
  end

  it 'Render the correct template' do
    user = User.create(name: 'Example')
    post = user.posts.create(title: 'Title Example')
    get user_post_path(user, post)
    expect(response).to render_template(:show)
  end

  it 'Show the page for a single post' do
    user = User.create(name: 'Example')
    post = user.posts.create(title: 'Title Example')
    get user_post_path(user, post)
    expect(response.body).to include('show a posts')
  end
end
