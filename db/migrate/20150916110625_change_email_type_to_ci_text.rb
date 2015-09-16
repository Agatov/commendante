class ChangeEmailTypeToCiText < ActiveRecord::Migration
  def up
    connection.execute 'CREATE EXTENSION IF NOT EXISTS citext'
    change_column :users, :email, :citext
  end

  def down
    change_column :users, :email, :string
    connection.execute 'DROP EXTENSION IF EXISTS citext'
  end
end
