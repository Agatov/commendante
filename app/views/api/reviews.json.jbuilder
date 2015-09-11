json.status "success"

json.reviews @reviews do |review|
  json.extract! review, :rate
  json.content review.content.gsub("\n", "<br />").html_safe
  json.username review.reviewer.name
  json.user_url review.reviewer.url
  json.avatar "http://#{HOSTNAME}" + review.reviewer.avatar_url
  json.date @widget.hide_reviews_date ? "" : Russian::strftime(review.created_at, "%d %B %H:%M") 
end