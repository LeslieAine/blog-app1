require_relative '../rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before do
      get '/users'
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct placeholder text' do
      expect(response.body).to include('Placeholder for /users and root')
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id' do
    before do
      User.create!(id: 1,
                   name: 'Example User',
                   photo: 'https://via.placeholder.com/150',
                   bio: 'This is an example user bio.',
                   posts_counter: 0)
      get '/users/1'
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct placeholder text' do
      expect(response.body).to include('Placeholder for /users/:id')
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
