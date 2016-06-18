json.extract! review, :rate
json.content decorate_text(review.content)
json.author_name review.reviewer.name
json.author_url review.reviewer.url
json.avatar review.reviewer.avatar_url(:widget)
json.date @widget.hide_reviews_date ? "" : Russian::strftime(review.created_at, "%d %B %Y")