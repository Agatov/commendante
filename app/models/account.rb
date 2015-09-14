class Account < ActiveRecord::Base
  include SendAnalyticsEvents
  
  belongs_to :widget
  has_many :users
  has_one :owner, class_name: "User"

  after_create :send_registration_event
end
