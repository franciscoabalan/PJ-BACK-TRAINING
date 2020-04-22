# require 'sidekiq-scheduler'

class RentExpirationWorker
  include Sidekiq::Worker

  def perform
    user_rents = User.joins(:rents).where('end_rent < ?', Time.now.to_date).uniq
    user_rents.each do |user|
      RentMailer.rent_expiration(user).deliver_now
    end
  end
end
