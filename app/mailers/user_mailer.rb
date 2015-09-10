class UserMailer < ActionMailer::Base
  layout 'mail'
  default from: 'noreply@getreview.ru'

  def user_invited(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: "Вам предоставлен доступ в getreview.ru")
  end

  def user_created(user)
    @user = user
    mail(to: @user.email, subject: "Спасибо за регистрацию в коменданте")
  end

  def email_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Подтвердите ваш email")
  end

  def password_change(user) 
    @user = user
    mail(to: @user.email, subject: "Запрос на изменение пароля")
  end
end