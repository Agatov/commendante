class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|
      t.string :name
      t.string :avatar
      t.string :provider
      t.string :uid
      t.string :url

      t.timestamps null: false
    end
  end
end
