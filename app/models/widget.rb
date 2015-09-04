class Widget < ActiveRecord::Base
  has_one :account
  has_many :reviews
end
