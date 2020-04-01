class RentSerializer < ActiveModel::Serializer
  attributes :id, :start_rent, :end_rent
  belongs_to :book
  belongs_to :user
end
