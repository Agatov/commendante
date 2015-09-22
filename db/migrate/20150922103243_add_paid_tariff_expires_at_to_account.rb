class AddPaidTariffExpiresAtToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :paid_tariff_expires_at, :datetime
  end
end
