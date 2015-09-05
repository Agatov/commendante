json.status "success"
json.company_name @widget.company_name
json.site_url @widget.site_url
json.reviews_count @widget.confirmed_reviews_count
json.average_rate @widget.average_rate || 0

json.reviews @reviews do |review|
  json.extract! review, :content, :rate
  json.username review.reviewer.name
  json.user_url review.reviewer.url
  json.avatar "http://localhost:3000" + review.reviewer.avatar_url
  json.date Russian::strftime(review.created_at, "%d %B %H:%M")
end