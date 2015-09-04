class Review < ActiveRecord::Base
  belongs_to :widget
  belongs_to :reviewer

  scope :unmoderated, -> {where(moderated: nil)}
  scope :confirmed, -> {where(moderated: true)}
  scope :rejected, -> {where(moderated: false)}
end
