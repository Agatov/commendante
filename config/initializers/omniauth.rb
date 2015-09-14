case HOSTNAME
  when "localhost:3000"
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :vkontakte, "5065287", "c7nyUUWlnE7JYxwF47aL"
      provider :odnoklassniki, "1154112000", "D3C0988A605912684E5BF553", :public_key => "CBALFLMFEBABABABA"
      provider :facebook, "958836017510529", "1edcce7ebd92b3f2f44c1618d9b646f5", 
        scope: 'email,public_profile',
        info_fields: 'id,email,gender,link,locale,name,timezone,updated_time,verified'
    end
  else
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :vkontakte, "5017668", "LitPB4X9zlyz9VSzOfR2"
      provider :odnoklassniki, "1154112000", "D3C0988A605912684E5BF553", :public_key => "CBALFLMFEBABABABA"
      provider :facebook, "958836017510529", "1edcce7ebd92b3f2f44c1618d9b646f5", 
        scope: 'email,public_profile',
        info_fields: 'id,email,gender,link,locale,name,timezone,updated_time,verified'
    end
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}