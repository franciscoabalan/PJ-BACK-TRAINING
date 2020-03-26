class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :editor, presence: true
  validates :genere, presence: true
  validates :year, presence: true
end
