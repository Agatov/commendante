class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]

    user = User.find_by_provider_and_uid "vkontakte", auth.uid

    unless user
      user = User.new
      user.name = auth.info.first_name + " " + auth.info.last_name
      user.remote_avatar_url = auth.extra.raw_info.photo_200_orig!
      user.url = auth.info.urls.Vkontakte
      user.uid = auth.uid
      user.provider = "vkontakte"
      user.save
    end

    session[:user_id] = user.id

    redirect_to "/sites/#{session[:site_url]}/?show_review_form=true"
  end
end