class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.integer :widget_id
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
