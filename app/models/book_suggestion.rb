class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :author, :link, :publisher, :year, presence: true
end
