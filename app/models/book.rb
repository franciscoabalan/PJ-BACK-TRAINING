class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :publisher, presence: true
  validates :genre, presence: true
  validates :year, presence: true
end
