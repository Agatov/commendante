class Reviewer < ActiveRecord::Base
  has_many :reviews
  mount_uploader :avatar, ReviewerAvatarUploader
end
