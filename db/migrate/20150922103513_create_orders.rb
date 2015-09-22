class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.integer :months_for_payment, default: 1
      t.integer :cost_per_month
      t.integer :sum
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
