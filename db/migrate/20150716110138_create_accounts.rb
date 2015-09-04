class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :widget_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
