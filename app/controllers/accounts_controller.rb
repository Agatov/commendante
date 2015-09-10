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
end