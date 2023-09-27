require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /comments/new' do
    it 'renders the new view' do
      get new_user_post_comment_path(user_id: 1, post_id: 1)
      expect(response).to render_template(:new)
    end
  end
end
