require_relative './rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(
      name: 'Alice',
      photo: 'https://this-person-does-not-exist.com/img/avatar-gen1182fdce25d4397d1e39a8b6b553a370.jpg',
      posts_counter: 0,
      bio: 'I am Alice, and I am a software engineer.'
    )
  end

  let(:post) do
    Post.create(
      title: 'My first post',
      author: user,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  subject do
    Comment.new(
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      post:,
      author: user
    )
  end

  before { subject.save }

  describe 'Functionality' do
    context 'update comments_counter' do
      it 'updates the comments_counter of the post' do
        expect { subject.update_comments_counter }.to change { post.comments_counter }.from(0).to(1)
      end
    end
  end
end
