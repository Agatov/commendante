class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :account_id
      t.string :email
      t.string :name
      t.string :password
      t.string :salt
      t.integer :role

      t.timestamps null: false
    end
  end
end
