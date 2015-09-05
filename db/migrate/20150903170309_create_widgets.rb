class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :uid
      t.string :company_name
      t.string :site_url
      t.string :email

      t.timestamps null: false
    end
  end
end
