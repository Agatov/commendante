class ReviewMailer < ActionMailer::Base
  layout 'mail'
  default from: 'noreply@getreview.ru'

  def review_added(review)
    @review = review
    mail(to: @review.widget.email, subject: "#{@review.reviewer.name} добавил новый отзыв")
  end

  def review_updated(review)
    @review = review
    mail(to: @review.widget.email, subject: "#{@review.reviewer.name} отредактировал свой отзыв")
  end

end