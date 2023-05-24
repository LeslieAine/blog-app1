require_relative '../rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    before do
      User.create!(id: 1,
                   name: 'Example User',
                   photo: 'https://via.placeholder.com/150',
                   bio: 'This is an example user bio.',
                   posts_counter: 0)
      get '/users/1/posts'
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct placeholder text' do
      expect(response.body).to include('Placeholder for /users/:id/posts')
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id/posts/:id' do
    before do
      User.create!(id: 1,
                   name: 'Example User',
                   photo: 'https://via.placeholder.com/150',
                   bio: 'This is an example user bio.',
                   posts_counter: 0)

      Post.create!(id: 1,
                   title: 'Example Post',
                   text: 'This is an example post body.',
                   comments_counter: 0,
                   likes_counter: 0,
                   author_id: 1)
      get '/users/1/posts/1'
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct placeholder text' do
      expect(response.body).to include('Placeholder for /users/:id/posts/:post_id')
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
