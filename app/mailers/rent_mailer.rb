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

  def new_rent(rent)
    email = rent.user.email
    @rent = rent

    mail(to: email, subject: 'Tus nuevos arriendos', from: 'noreply@book.com')
  end
end
