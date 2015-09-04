class AccountsController < ApplicationController

  layout "account"

  def show
    @widget = current_user.account.widget
    gon.jbuilder template: 'app/views/account/show.json'
    render "account/show"
  end

  def current_user
    @current_user = User.first
  end

  helper_method :current_user
end