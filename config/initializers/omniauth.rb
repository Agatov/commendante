case HOSTNAME
  when "localhost:3000"
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :vkontakte, "5065287", "c7nyUUWlnE7JYxwF47aL"
    end
  else
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :vkontakte, "5017668", "LitPB4X9zlyz9VSzOfR2"
    end
end