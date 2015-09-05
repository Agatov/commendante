class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]

    reviewer = Reviewer.find_by_provider_and_uid "vkontakte", auth.uid

    unless reviewer
      reviewer = Reviewer.new
      reviewer.name = auth.info.first_name + " " + auth.info.last_name
      reviewer.remote_avatar_url = auth.extra.raw_info.photo_200_orig!
      reviewer.url = auth.info.urls.Vkontakte
      reviewer.uid = auth.uid
      reviewer.provider = "vkontakte"
      reviewer.save
    end

    session[:reviewer_id] = reviewer.id
    
    redirect_to "/board?widget=#{session[:widget]}"
  end
end