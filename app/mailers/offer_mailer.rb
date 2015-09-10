class OfferMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  layout 'mail'
  default from: 'noreply@getreview.ru'

  def offer_created(offer)
    @offer = offer
    mail(to: @offer.email, subject: @offer.email_subject)
  end

end