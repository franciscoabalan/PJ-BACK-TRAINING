class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_rent, presence: true
  validates :end_rent, presence: true
end
