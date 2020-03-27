class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :image, :publisher, :genre, :year
end
