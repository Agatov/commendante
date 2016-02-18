class Widget < ActiveRecord::Base
  has_one :account
  has_many :reviews
  has_one :email_template
  has_many :offers
  has_many :mass_offer_tasks

  before_create :generate_uid
  after_create :create_email_template

  def board_url
    "board/#{self.uid}"
  end

  def reviews_count
    self.reviews.count
  end

  def new_reviews_count
    self.reviews.unmoderated.count
  end

  def confirmed_reviews_count
    self.reviews.confirmed.count
  end

  def rejected_reviews_count
    self.reviews.rejected.count
  end

  def average_rate
    self.reviews.confirmed.average(:rate)
  end

  def create_email_template
    email_template = self.build_email_template
    email_template.default_values
    email_template.save
  end 


  protected

  def generate_uid
    self.uid = loop do
      random_uid = SecureRandom.hex(10)
      break random_uid unless Widget.exists?(uid: random_uid)
    end
  end
end
