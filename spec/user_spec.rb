require_relative './rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Alice',
      photo: 'https://this-person-does-not-exist.com/img/avatar-gen1182fdce25d4397d1e39a8b6b553a370.jpg',
      posts_counter: 0,
      bio: 'I am Alice, and I am a software engineer.'
    )
  end

  before { subject.save }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with negative posts_counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Functionality' do
    context 'get recent posts' do
      it 'returns the 3 most recent posts' do
        5.times do |i|
          Post.create(
            title: "Post #{i}",
            author: subject,
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            comments_counter: 0,
            likes_counter: 0
          )
        end

        expect(subject.recent_posts.count).to eq(3)
      end
    end
  end
end
