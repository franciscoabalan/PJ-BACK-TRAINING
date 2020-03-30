FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    image { Faker::Avatar.image }
    publisher { Faker::Book.publisher }
    genre { Faker::Book.genre }
    year { [1990..2020].sample }
  end
end
