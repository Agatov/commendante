class Widget < ActiveRecord::Base
  has_one :account
  has_many :reviews

  before_create :generate_uid

  def board_url
    "board/#{self.uid}"
  end


  protected

  def generate_uid
    self.uid = loop do
      random_uid = SecureRandom.hex(10)
      break random_uid unless Widget.exists?(uid: random_uid)
    end
  end
end
