class LandingsController < ApplicationController
  layout "landing"

  before_action :check_utm
  
  def index
  end

  def check_utm
    if params[:utm_source]
      cookies[:utm_source] ||= params[:utm_source]
      cookies[:utm_medium] ||= params[:utm_medium]
      cookies[:utm_campaign] ||= params[:utm_campaign]
      cookies[:utm_region] ||= params[:utm_region]
      cookies[:user_temp_id] = (Time.now.to_i.to_s + rand(9999).to_s).to_i

      MixpanelService.new({
        user_temp_id: cookies[:user_temp_id],
        event: {
          message: "Пользователь посетил сайт",
          params: {
            utm_source: cookies[:utm_source],
            utm_medium: cookies[:utm_medium],
            utm_campaign: cookies[:utm_campaign],
            utm_region: cookies[:utm_region]
          }
        }
      }).send_anonymous_event

      redirect_to root_path 
    end
  end
end