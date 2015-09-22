class AddTariffToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :tariff, :integer, default: 0
  end
end
