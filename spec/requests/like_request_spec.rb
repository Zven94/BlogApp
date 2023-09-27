require 'rails_helper'

RSpec.describe LikesController, type: :request do
  describe 'POST #create' do
    it 'creates a new like' do
      post '/users/1/posts/2/likes', params: { like: { post_id: 2 } }
      expect(response).to have_http_status(:ok) # Verificar el código de estado 200
      expect(response.body).to include('Like it')
    end
  end

  it 'deletes a like' do
    user = User.create(name: 'Nombre de Usuario')
    post = Post.create(author_id: user.id, title: 'Título del Post', text: 'Contenido del Post')
    like = Like.create(user_id: user.id, post_id: post.id)

    delete "/users/#{user.id}/posts/#{post.id}/likes/#{like.id}"
    expect(response).to redirect_to(user_post_path(user, post))
    # expect(response.body).to include("Don't like")
  end
end
