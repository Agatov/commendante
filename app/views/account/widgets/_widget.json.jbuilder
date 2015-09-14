json.extract! widget, 
  :uid, 
  :company_name, 
  :site_url, 
  :email, 
  :reviews_count_for_show, 
  :hide_reviews_date,
  :color_schema

json.reviews_count widget.reviews_count
json.new_reviews_count widget.new_reviews_count
json.confirmed_reviews_count widget.confirmed_reviews_count
json.rejected_reviews_count widget.rejected_reviews_count
