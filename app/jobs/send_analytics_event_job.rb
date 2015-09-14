class SendAnalyticsEventJob < ActiveJob::Base
  queue_as :active_jobs_default

  def perform(user_id, message, event_params)
    mixpanel_conf = YAML.load_file("#{Rails.root}/config/mixpanel.yml")
    tracker = Mixpanel::Tracker.new(mixpanel_conf["#{Rails.env}_token"])
    
    tracker.track(user_id, message, event_params)
  end
end