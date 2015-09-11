case HOSTNAME
  when "localhost:3000"
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :vkontakte, "5065287", "c7nyUUWlnE7JYxwF47aL"
      provider :odnoklassniki, "1154112000", "D3C0988A605912684E5BF553", :public_key => "CBALFLMFEBABABABA"
    end
  else
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :vkontakte, "5017668", "LitPB4X9zlyz9VSzOfR2"
      provider :odnoklassniki, "1154112000", "D3C0988A605912684E5BF553", :public_key => "CBALFLMFEBABABABA"
    end
end