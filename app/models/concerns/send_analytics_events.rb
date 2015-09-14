module SendAnalyticsEvents
  extend ActiveSupport::Concern

  def send_registration_event
    registration_event = MixpanelService.new({
      account_id: self.id
    }).registration
  end
end