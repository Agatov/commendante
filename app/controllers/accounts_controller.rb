class AccountsController < ApplicationController

  before_action :authenticate_user!
  
  layout "account"

  def show
    @widget = current_user.account.widget
    gon.jbuilder template: 'app/views/account/show.json'
    render "account/show"
  end
end