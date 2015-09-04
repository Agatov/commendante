class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :widget_id
      t.integer :reviewer_id
      t.boolean :moderated, default: nil
      t.integer :rate
      t.text :content

      t.timestamps null: false
    end
  end
end
