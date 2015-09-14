require 'mixpanel-ruby'

class MixpanelService
  def initialize(params)
    #tracker_log = open("#{Rails.root}/log/staging_mixpanel.log", "a+")

    @account = Account.find params[:account_id]
    @params = params
  end

  def registration
    RegistrationAnalyticsAccountJob.perform_later @account, I18n.t('analytics.messages.account_create')
  end

  def send_event
    @message = @params[:event][:message]
    @event_params = @params[:event][:params] || {}

    SendAnalyticsEventJob.perform_later(@account.id, @message, @event_params)
  end
end