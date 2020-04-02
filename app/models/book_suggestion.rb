class BookSuggestion < ApplicationRecord
  belongs_to :user

  validates :title, :author, :link, :publisher, :year, presence: true
end
