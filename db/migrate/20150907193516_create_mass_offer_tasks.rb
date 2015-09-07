class CreateMassOfferTasks < ActiveRecord::Migration
  def change
    create_table :mass_offer_tasks do |t|
      t.integer :widget_id
      t.text :emails
      t.integer :status

      t.timestamps null: false
    end
  end
end
