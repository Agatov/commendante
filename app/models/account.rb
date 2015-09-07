class Account < ActiveRecord::Base
  belongs_to :widget
  has_many :users
end
