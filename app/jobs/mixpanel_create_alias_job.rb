class MixpanelCreateAliasJob < ActiveJob::Base
  queue_as :active_jobs_default

  def perform(account_id, user_temp_id)
    mixpanel_conf = YAML.load_file("#{Rails.root}/config/mixpanel.yml")
    tracker = Mixpanel::Tracker.new(mixpanel_conf["#{Rails.env}_token"])
    
    tracker.alias account_id, user_temp_id
  end
end