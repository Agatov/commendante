class Review < ActiveRecord::Base
  belongs_to :widget
  belongs_to :reviewer

  scope :unmoderated, -> {where(moderated: nil)}
  scope :confirmed, -> {where(moderated: true)}
  scope :rejected, -> {where(moderated: false)}

  scope :with_tariff_limit, -> (account) {
    if account.free?
      limit(10)
    end
  }

  before_save do
    set_unmoderated! if content_changed? or rate_changed?
  end

  def confirmed?
    (self.moderated == true)
  end

  def rejected?
    (self.moderated == false)
  end

  def unmoderated?
    self.moderated.nil?
  end

  def set_unmoderated!
    self.moderated = nil
  end
end
