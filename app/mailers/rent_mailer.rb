class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.new_rent.subject
  #
  def rent_expiration(user)
    email = user.email
    @rents = user.rents.where('end_rent < ?', Time.now.to_date)

    mail(to: email, subject: 'Tienes libros vencidos', from: 'noreply@book.com')
  end
end
