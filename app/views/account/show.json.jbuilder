json.widget do
  json.reviews_count @widget.reviews.count
  json.new_reviews_count @widget.reviews.unmoderated.count
  json.confirmed_reviews_count @widget.reviews.confirmed.count
  json.rejected_reviews_count @widget.reviews.rejected.count
end