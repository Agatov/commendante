class AddHideReviewsDateToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :hide_reviews_date, :boolean, default: false
  end
end
