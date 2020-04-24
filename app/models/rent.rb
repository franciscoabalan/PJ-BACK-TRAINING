class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  after_create :notify_mail

  validates :start_rent, :end_rent, presence: true

  private

  def notify_mail
    NewRentWorker.perform_async(id)
  end
end
