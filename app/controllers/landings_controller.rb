class LandingsController < ApplicationController
  layout "mail"
  
  def index
    render "/app/views/user_mailer/user_inviter"
  end

  def mail
  end
end