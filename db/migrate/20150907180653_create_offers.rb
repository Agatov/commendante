class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :widget_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :email_subject
      t.text :email_body
      t.text :sms_text
      t.integer :email_status
      t.integer :sms_status

      t.timestamps null: false
    end
  end
end
