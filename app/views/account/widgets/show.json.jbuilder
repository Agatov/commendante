json.extract! @widget, :uid, :company_name, :site_url, :email

json.reviews_count @widget.reviews.count
json.new_reviews_count @widget.reviews.unmoderated.count
json.confirmed_reviews_count @widget.reviews.confirmed.count
json.rejected_reviews_count @widget.reviews.rejected.count