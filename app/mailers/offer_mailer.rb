class OfferMailer < ActionMailer::Base
  layout 'mail'
  default from: 'noreply@commendante.ru'

  def offer_sended(offer)
    @offer = offer
    mail(to: @offer.email, subject: @offer.subject)
  end

end