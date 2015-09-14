class RegistrationAnalyticsAccountJob < ActiveJob::Base
  queue_as :active_jobs_default

  def perform(account, message)
    mixpanel_conf = YAML.load_file("#{Rails.root}/config/mixpanel.yml")
    #tracker = Mixpanel::Tracker.new(mixpanel_conf["#{Rails.env}_token"])
    tracker = Mixpanel::Tracker.new(mixpanel_conf["development_token"])
    
    tracker.people.set(account.id, {
      "$name" => account.owner.name,
      "$created" => account.created_at,
      "$email" => account.owner.email
    });

    tracker.track(account.id, message, {account_id: account.id})
  end
end