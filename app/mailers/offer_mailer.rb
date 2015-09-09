class OfferMailer < ActionMailer::Base
  layout 'mail'
  default from: 'noreply@commendante.ru'

  def offer_created(offer)
    @offer = offer
    mail(to: @offer.email, subject: @offer.subject)
  end

end