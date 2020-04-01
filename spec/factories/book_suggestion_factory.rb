FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false) }
    price { rand(1000..5000) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year { rand(1990..2020).to_s }
  end
end
