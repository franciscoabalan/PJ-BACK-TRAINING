FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    image { Faker::Avatar.image }
    publisher { Faker::Book.publisher }
    genre { Faker::Book.genre }
    year { rand(1990..2020).to_s }
  end
end
