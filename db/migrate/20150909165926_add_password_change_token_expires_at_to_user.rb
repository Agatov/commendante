class AddPasswordChangeTokenExpiresAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_change_token_expires_at, :datetime
  end
end
