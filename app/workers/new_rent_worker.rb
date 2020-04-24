# require 'sidekiq-scheduler'

class NewRentWorker
  include Sidekiq::Worker

  def perform(rent_id)
    rent = Rent.find(rent_id)
    RentMailer.new_rent(rent).deliver_now
  end
end
