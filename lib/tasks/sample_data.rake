# rubocop:disable Metrics/BlockLength
# rubocop:disable Layout/LineLength
namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:drop, :create, 'schema:load', :seed, :populate_sample_data] do
    puts 'Ready to go!'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    # user with id 1
    User.create!(
      id: 1,
      name: 'First User',
      photo: 'https://www.aceshowbiz.com/images/still/preview/batman-poster04.jpg',
      bio: "This is the first user's bio.",
      posts_counter: 0
    )

    j = 20
    50.times do |i|
      Post.create(
        id: i + 20,
        title: "First user's post #{i + 20}",
        text: 'Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.',
        comments_counter: 0,
        likes_counter: 0,
        author_id: 1
      )

      Comment.create(
        id: j,
        text: 'Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.',
        author_id: 1,
        post_id: i + 20
      )

      Like.create(
        id: j,
        author_id: 1,
        post_id: i + 20
      )

      j += 1
    end

    10.times do |i|
      User.create!(
        id: i + 2,
        name: "Example User #{i + 2}",
        photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png',
        bio: "This is an example user #{i + 2} bio.",
        posts_counter: 0
      )

      Post.create(
        id: i + 2,
        title: "Example post #{i + 2}",
        text: 'Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.',
        comments_counter: 0,
        likes_counter: 0,
        author_id: i + 2
      )

      Comment.create(
        id: i + 2,
        text: "Example comment #{i + 2}",
        author_id: i + 2,
        post_id: i + 2
      )

      Like.create(
        id: i + 2,
        author_id: i + 2,
        post_id: i + 2
      )
    end
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/BlockLength
