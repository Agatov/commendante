class AddPasswordChangeTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_change_token, :string
  end
end
