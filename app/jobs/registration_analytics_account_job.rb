class RegistrationAnalyticsAccountJob < ActiveJob::Base
  queue_as :active_jobs_default

  def perform(account, message)
    mixpanel_conf = YAML.load_file("#{Rails.root}/config/mixpanel.yml")
    tracker = Mixpanel::Tracker.new(mixpanel_conf["#{Rails.env}_token"])

    account_owner_name = account.owner.name.nil? ? "Без имени" : account.owner.name
    
    tracker.people.set(account.id, {
      "$name" => account_owner_name,
      "$created" => account.created_at,
      "$email" => account.owner.email
    });

    tracker.track(account.id, message, {account_id: account.id})
  end
end