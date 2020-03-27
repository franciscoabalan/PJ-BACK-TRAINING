class Book < ApplicationRecord
  validates :title, :author, :image, :editor, :genere, :year, presence: true
end
