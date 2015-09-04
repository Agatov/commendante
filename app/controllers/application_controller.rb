class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to sign_in_path unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find session[:user_id]
  end
  helper_method :current_user

  def user_signed_in?
    #return false if session[:user_id] and session[:user_id].empty?
    session[:user_id] ? true : false
  end

end
