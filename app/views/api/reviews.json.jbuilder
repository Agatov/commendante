json.status "success"
json.company_name @widget.company_name
json.site_url @widget.site_url
json.reviews_count @widget.confirmed_reviews_count
json.reviews_count_text Russian.p(@widget.confirmed_reviews_count, "реальный отзыв", "реальных отзыва", "реальных отзывов")

average_rate = @widget.average_rate || 0

json.average_rate average_rate
json.average_rate_rounded average_rate.round

json.review_board_url "http://localhost:3000/" + @widget.board_url


json.reviews @reviews do |review|
  json.extract! review, :rate
  json.content review.content.gsub("\n", "<br />").html_safe
  json.username review.reviewer.name
  json.user_url review.reviewer.url
  json.avatar "http://localhost:3000" + review.reviewer.avatar_url
  json.date Russian::strftime(review.created_at, "%d %B %H:%M")
end