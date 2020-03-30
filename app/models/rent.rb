class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_rent, :end_rent, presence: true
end
