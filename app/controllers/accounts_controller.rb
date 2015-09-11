class AccountsController < ApplicationController
  include ApplicationHelper

  before_action :check_mobile_devise
  before_action :authenticate_user!
  
  layout "account"

  def show
    @profile = current_user
    @widget = current_user.account.widget
    gon.jbuilder template: 'app/views/account/show.json'
    render "account/show"
  end

  def mobile_devise
    render layout: "mobile"
  end

  def check_mobile_devise
    if mobile_devise?
      return render "account/mobile_devise", layout: "mobile"
    end
  end

  def authenticate_user!
    unless user_signed_in?
      logout
      redirect_to sign_in_path 
    end
  end

  def current_user
    begin
      @current_user ||= User.find session[:user_id]
    rescue
      return false
    end
    @current_user
  end

  helper_method :current_user

  def user_signed_in?
    #return false if session[:user_id] and session[:user_id].empty?
    signed_in = session[:user_id] ? true : false
    (signed_in and current_user)
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    reset_session
  end
end