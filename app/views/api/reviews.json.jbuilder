json.status "success"
json.company_name @site.name
json.site_url @site.url
json.reviews_count @reviews.count

json.reviews @reviews do |review|
  json.extract! review, :title, :content, :positive
  json.username review.user.name
  json.user_url review.user.url
  json.avatar "http://localhost:3000" + review.user.avatar_url
  json.date Russian::strftime(review.created_at, "%d %B %H:%M")
end