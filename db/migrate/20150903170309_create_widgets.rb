class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :uid
      t.string :company_name
      t.string :site_url
      t.string :email
      t.integer :reviews_count
      t.float :average_rate

      t.timestamps null: false
    end
  end
end
