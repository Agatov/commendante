class Account < ActiveRecord::Base
  include SendAnalyticsEvents
  
  belongs_to :widget
  has_many :users
  has_many :orders
  has_one :owner, class_name: "User"

  enum tariff: [:free, :paid]

  after_create :send_registration_event
end
