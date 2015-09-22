class Order < ActiveRecord::Base
  belongs_to :account

  enum status: [:unpaid, :paid]
end
