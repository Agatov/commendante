class AddReviewsCountForShowToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :reviews_count_for_show, :integer, default: 0
  end
end
