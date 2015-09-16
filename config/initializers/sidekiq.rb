require "sidekiq"
require "sidekiq-status"


case HOSTNAME
  when "localhost:3000" then namespace = "getreview"
  when "staging.getreview.ru" then namespace = "getreview_staging"
  when "getreview.ru" then namespace = "getreview"
  else namespace = "getreview"
end

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
  config.redis = { :namespace => namespace, :url => 'redis://127.0.0.1:6379/3' }
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  end
  config.redis = { :namespace => namespace, :url => 'redis://127.0.0.1:6379/3' }
end