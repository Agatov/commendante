json.status "success"
json.company_name @widget.company_name
json.site_url @widget.site_url
json.reviews_count @widget.confirmed_reviews_count
json.reviews_count_text Russian.p(@widget.confirmed_reviews_count, "реальный отзыв", "реальных отзыва", "реальных отзывов")

json.show_widget (@widget.confirmed_reviews_count >= @widget.reviews_count_for_show)

average_rate = @widget.average_rate || 0

json.average_rate average_rate
json.average_rate_rounded average_rate.round

json.review_board_url "http://#{HOSTNAME}/" + @widget.board_url