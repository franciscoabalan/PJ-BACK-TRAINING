class Book < ApplicationRecord
  validates :title, :author, :image, :publisher, :genre, :year, presence: true
end
