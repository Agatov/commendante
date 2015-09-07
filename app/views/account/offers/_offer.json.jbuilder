json.extract! offer, :id, :name, :email, :email_status
json.date offer.created_at.strftime("%Y-%m-%d")
