class Review < ActiveRecord::Base
  belongs_to :widget
  belongs_to :reviewer

  scope :unmoderated, -> {where(moderated: nil)}
  scope :confirmed, -> {where(moderated: true)}
  scope :rejected, -> {where(moderated: false)}

  def confirmed?
    (self.moderated == true)
  end

  def rejected?
    (self.moderated == false)
  end

  def unmoderated?
    (self.moderated == nil)
  end
end
