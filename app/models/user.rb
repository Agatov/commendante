class User < ActiveRecord::Base
  belongs_to :account
  
  validates :email, uniqueness: {message: I18n.t('auth.user_email_already_exists_error')}, presence: true, email: true
  validates :password, length: {minimum: 6}, presence: true

  enum role: [:owner, :admin, :moderator]

  def can_authorize? (password)
    return true if self.password == encrypt(password + self.salt)
    false
  end

  def encrypt_password
    self.set_password self.password
  end

  def generate_password
    password_string = random_string(8)
    set_password password_string
    password_string
  end

  def set_password (password)
    self.salt = random_string(8)
    self.password = encrypt(password + salt)
  end

  def encrypt(string)
    Digest::MD5.hexdigest string    
  end

  def generate_email_confirmation_token
    self.email_confirmation_token = random_string(16)
  end

  def generate_change_password_token
    self.password_change_token = loop do
      radom_token = SecureRandom.hex(16)
      break radom_token unless User.exists?(password_change_token: radom_token)
    end

    self.password_change_token_expires_at = Time.now + 3.hours
  end

  def random_string(n)
    (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle.first(n).join
  end
end
