require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'renders a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'Render the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'Show the page for create user' do
      get '/users'
      expect(response.body).to include('Users')
    end
  end

  describe 'GET /users/:id' do
    it 'devuelve una respuesta exitosa' do
      user = User.create(name: 'Ejemplo')
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end

    it 'Render the correct template' do
      user = User.create(name: 'Ejemplo')
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'Show the page for create user' do
      user = User.create(name: 'Ejemplo')
      get "/users/#{user.id}"
      expect(response.body).to include("#{user.name}")
    end
  end
end
